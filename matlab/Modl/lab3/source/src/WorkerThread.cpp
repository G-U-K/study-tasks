#include "WorkerThread.h"
#include "ChartWindow.h"
#include "ThreadDispatcher.h"

void WorkerThread::Initialize(string dataToWrite, ChartWindow * window)
{
	_dataToWrite = std::move(dataToWrite);

	int minReaderNumber = 2;
	int maxReaderNumber = 5;
	_subThreads.reserve(maxReaderNumber - minReaderNumber + 1);

	window->AddTaskNumber(_subThreads.size());

	for (int readerNumber = minReaderNumber; readerNumber <= maxReaderNumber; ++readerNumber)
	{
		auto sharedFilename = QApplication::applicationDirPath() + QString("/shared_file_%1.txt").arg(readerNumber);
		// auto chartName = GenerateChartName(readerNumber);
		window->CreateChart(readerNumber);

		auto thread = _subThreads.emplace_back(new WorkerSubThread());
		thread->Initialize(_dataToWrite, sharedFilename.toStdString(), readerNumber);
		connect(thread, &WorkerSubThread::resultReady, window, &ChartWindow::AddResult);
		connect(thread, &WorkerSubThread::errorOccured, window, &ChartWindow::LogError);

		connect(thread, &WorkerSubThread::started, window, &ChartWindow::OnCompleteTask);
		connect(thread, &WorkerSubThread::addTaskNumber, window, &ChartWindow::AddTaskNumber);
		connect(thread, &WorkerSubThread::resultReady, window, &ChartWindow::OnCompleteTask);
	}
}

void WorkerThread::run()
{
	for (auto thread : _subThreads)
	{
		thread->start();
	}

	for (auto thread : _subThreads)
	{
		thread->wait();
		thread->deleteLater();
	}
}

void WorkerSubThread::Initialize(string_view dataToWrite, string sharedFilename, int readerNumber)
{
	_dataToWrite = dataToWrite;
	_sharedFilename = std::move(sharedFilename);
	_readerNumber = std::max(1, readerNumber);
}

void WorkerSubThread::run()
{
	auto probNumber = 99 / _readerNumber;
	emit addTaskNumber(probNumber);

	for (int prob = probNumber; prob >= 1; --prob)
	{			
		int times = 100;

		double writerProb = 0.0;
		size_t readSymbols = 0;
		
		for (int i = 0; i < times; ++i)
		{
			ThreadDispatcher dispatcher;
			bool success = dispatcher.Initialize(_sharedFilename, _dataToWrite, _readerNumber, prob);
			if (!success)
			{
				auto error = dispatcher.GetLastError();
				QString errorMsg;
				switch (error)
				{
				case ThreadDispatcherError::InvalidFile:
					errorMsg = QString(u8"Не удалось открыть файл \"%1\" для работы! Проверьте отсутствие кириллицы в пути до файла.").arg(_sharedFilename.c_str());
					break;
				default:
					errorMsg = u8"Во время инициализации произошла неизвестная ошибка!";
				case ThreadDispatcherError::NoError: break;
				}
				emit errorOccured(_readerNumber, errorMsg);
				return;
			}

			dispatcher.Start();
			auto result = dispatcher.ComputeResult();

			writerProb += result.writerProb;
			readSymbols += std::accumulate(result.readSymbols.begin(), result.readSymbols.end(), size_t(0));
		}
		
		emit resultReady(_readerNumber, writerProb / static_cast<double>(times), readSymbols / static_cast<double>(times));
	}
}
