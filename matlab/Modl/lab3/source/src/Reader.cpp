#include "Reader.h"

#include "File.h"

void Reader::BindFile(const shared_ptr<File> & file)
{
	_file = file;
}

void Reader::DoWork()
{
	if (auto file = GetFile())
	{
		if (auto symbol = file->Read(); symbol != File::eof)
		{
			StoreSymbol(static_cast<char>(symbol));
			_counter += 1;
			_filePos += 1;
		}
	}
}

void Reader::StoreSymbol(char symbol)
{
	try
	{
		// std::cout << "Read symbol: '" << symbol << "'" << std::endl;
		_buffer.push_back(symbol);
	}
	catch (const std::bad_alloc & ex)
	{
		std::cerr << "[E]: Reader thread could not store symbol: " << ex.what() << ". Buffer has been cleared." << std::
			endl;
		_buffer.clear();
		_buffer.shrink_to_fit();
	}
}
