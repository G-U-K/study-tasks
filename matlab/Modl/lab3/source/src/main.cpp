#include "ChartWindow.h"
// #include "ScopeRedirect.h"
#include "WorkerThread.h"

int main(int argc, char* argv[])
{
	QApplication app(argc, argv);

	auto appDir = QApplication::applicationDirPath().toStdString();
	// auto redirectErrors = ScopeRedirect(std::cerr,  appDir + "/err.txt");
	// auto redirectOutput = ScopeRedirect(std::cout, appDir + "/out.txt");
	
	ChartWindow w{};
	w.show();

	string dataToWrite;
	{
		std::ifstream t(appDir + "/cat_text.txt");
		dataToWrite = string(std::istreambuf_iterator<char>(t), std::istreambuf_iterator<char>());
	}
	
	auto workerThread = new WorkerThread();
	QObject::connect(workerThread, &WorkerThread::finished, workerThread, &QObject::deleteLater);
	workerThread->Initialize(std::move(dataToWrite), &w);
	workerThread->start();

	QApplication::exec();

	return 0;
}
