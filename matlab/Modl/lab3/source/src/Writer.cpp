#include "Writer.h"
#include "File.h"

void Writer::BindFile(const shared_ptr<File> & file)
{
	_file = file;
}

void Writer::LinkBuffer(string_view buffer)
{
	_buffer = buffer;
}

void Writer::DoWork()
{
	if (auto file = GetFile(); file && !IsWorkCompleted())
	{
		if (_pos == 0)
		{
			file->Clear();
		}

		auto symbol = GetSymbol();
		// std::cout << "Wrote symbol: '" << symbol << "'" << std::endl;
		file->Write(symbol);

		_pos += 1;
	}
}

void Writer::SetNextPosition()
{
	_pos = (_pos + 1) % _buffer.size();
}
