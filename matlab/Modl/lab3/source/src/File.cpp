#include "File.h"

File::File(string_view filename)
	: _filename(filename)
	, _file(_filename,std::fstream::in | std::fstream::out | std::fstream::trunc)
{
}

int File::Read()
{
	if (_file.peek() == EOF)
	{
		_file.seekg(0);
	}
	return _file.get();
}

void File::Clear()
{
	if (_file.is_open())
	{
		_file.close();
	}
	_file.open(_filename, std::fstream::out | std::fstream::in | std::fstream::trunc);
}

void File::Write(char symbol)
{
	_file.put(symbol);
}
