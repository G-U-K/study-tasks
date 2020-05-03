#pragma once

class ChartWindow;
class ThreadDispatcher;
class WorkerSubThread;

class WorkerThread : public QThread
{
	Q_OBJECT
	
public:
	void Initialize(string dataToWrite, ChartWindow * chartWindow);

	void run() override;
	
signals:
	void resultReady(const QString & chartName, double writerProb, double readSymbols);
	void errorOccured(const QString & chartName, const QString & desc);

private:	
	string						_dataToWrite;
	vector<WorkerSubThread *>	_subThreads;
};

class WorkerSubThread : public QThread
{
	Q_OBJECT
	
public:
	void Initialize(string_view dataToWrite, string sharedFilename, int readerNumber);

	void run() override;
	
signals:
	void addTaskNumber(int n);
	void resultReady(int readerNumber, double writerProb, double readSymbols);
	void errorOccured(int readerNumber, const QString & desc);

private:	
	string_view			_dataToWrite;
	string				_sharedFilename;
	int					_readerNumber = 0;
};