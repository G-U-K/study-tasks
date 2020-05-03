#pragma once
#include "Thread.h"
#include "File.h"

class Reader final : public Thread
{
public:
	void BindFile(const shared_ptr<File> & file) override;
	void DoWork() override;

	bool IsWorkCompleted() const override { return false; }
	size_t GetReadSymbolsNumber() const { return _counter; }
	
private:
	auto GetFile() const { return _file.lock(); }
	void StoreSymbol(char symbol);

	string				_buffer;
	size_t				_counter = 0;
	weak_ptr<File>		_file;
	File::Position		_filePos = 0;
};