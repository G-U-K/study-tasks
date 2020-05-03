#pragma once

class File;

class Thread
{
public:
	virtual ~Thread() = default;

	virtual void BindFile(const shared_ptr<File> & file) = 0;
	virtual void DoWork() = 0;
	virtual bool IsWorkCompleted() const = 0;
};
