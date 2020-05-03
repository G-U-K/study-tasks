#include "ThreadDispatcher.h"

#include <iomanip>

#include "File.h"
#include "Writer.h"
#include "Reader.h"

ThreadDispatcher::ThreadDispatcher() = default;
ThreadDispatcher::~ThreadDispatcher() = default;

bool ThreadDispatcher::Initialize(string_view filename, string_view writeData, int readerNumber, double readerProb)
{
	_generator = make_unique<std::mt19937>(std::random_device()());

	_file = make_shared<File>(filename);
	if (!_file->IsOpen())
	{
		_error = ThreadDispatcherError::InvalidFile;
		return false;
	}
	
	readerProb = std::clamp(readerProb, 0.0, 100.0 / readerNumber);
	_readerProb = static_cast<double>(readerProb) / 100;

	_writer = make_unique<Writer>();
	_writer->LinkBuffer(writeData);

	_readers.resize(readerNumber);
	for (auto & reader : _readers)
	{
		reader = make_unique<Reader>();
	}

	_processes.reserve(readerNumber + 1);
	for (const auto & reader : _readers)
	{
		_processes.emplace_back(reader.get());
	}
	_processes.emplace_back(_writer.get());

	for (auto & process : _processes)
	{
		process->BindFile(_file);
	}

	return true;
}

void ThreadDispatcher::Start()
{
	while (!_writer->IsWorkCompleted())
	{
		auto thread = GetNextThread();
		thread->DoWork();
	}
}

ThreadDispatcher::Result ThreadDispatcher::ComputeResult() const
{
	Result result;
	for (const auto & reader : _readers)
	{
		result.readSymbols.emplace_back(reader->GetReadSymbolsNumber());
	}
	result.writerProb = 1.0 - std::clamp(_readers.size() * _readerProb, 0.0, 1.0);
	return result;
}

Thread* ThreadDispatcher::GetNextThread() const
{
	std::uniform_real_distribution<> dis(0.0, 1.0);
	auto & gen = *_generator;
	auto random_value = static_cast<double>(dis(gen));

	auto _value = std::lround(std::clamp(random_value * 100, 0.0, 100.0));
	auto _prob = std::lround(_readerProb * 100);
	
	auto threadIndex = _value / _prob;

	if (threadIndex < static_cast<long>(_readers.size()))
	{
		return _processes[threadIndex];
	}
	return _writer.get();
}
