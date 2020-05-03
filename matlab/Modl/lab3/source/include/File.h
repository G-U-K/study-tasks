#pragma once


class File
{
public:
	using Position = std::fstream::pos_type;
	constexpr static auto eof = EOF;
	
	explicit File(string_view filename);

	bool IsOpen() const { return _file.is_open(); }

	int Read();
	
	void Clear();
	void Write(char symbol);
	
private:
	string					_filename;
	std::fstream			_file;
};