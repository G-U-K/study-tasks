#pragma once

#include "Thread.h"

class Writer final : public Thread
{
public:
	void BindFile(const shared_ptr<File> & file) override;
	void LinkBuffer(string_view buffer);

	void DoWork() override;
	bool IsWorkCompleted() const override { return _pos == _buffer.size(); }

private:
	auto GetSymbol() const { return _buffer[_pos]; }
	auto GetFile() const { return _file.lock(); }

	void SetNextPosition();

	weak_ptr<File>		_file;
	size_t				_pos = 0;
	string_view			_buffer;
};
