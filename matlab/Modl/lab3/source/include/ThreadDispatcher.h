#pragma once

class File;
class Thread;
class Writer;
class Reader;

enum class ThreadDispatcherError
{
	InvalidFile,
	NoError
};

class ThreadDispatcher
{
public:
	ThreadDispatcher();
	~ThreadDispatcher();
	
	/**
	 * \param filename file to use by processes
	 * \param writeData pointer to data buffer of the writer thread
	 * \param readerNumber number of reader threads in range [2; 5]
	 * \param readerProb probability of passing control to the reader thread as a percentage
	 */
	bool Initialize(string_view filename, string_view writeData, int readerNumber, double readerProb);

	void Start();

	struct Result
	{
		double			writerProb = 0.0;
		vector<size_t>	readSymbols;
	};

	Result ComputeResult() const;

	ThreadDispatcherError GetLastError() const { return _error; }
	
private:
	[[nodiscard]] Thread* GetNextThread() const;

	shared_ptr<File>				_file;
	unique_ptr<std::mt19937>		_generator;
	double							_readerProb = 0.0;
	
	vector<Thread *>				_processes;
	vector<unique_ptr<Reader>>		_readers;
	unique_ptr<Writer>				_writer;
	ThreadDispatcherError			_error = ThreadDispatcherError::NoError;
};