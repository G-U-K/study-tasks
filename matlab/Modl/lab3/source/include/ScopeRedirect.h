#pragma once

class ScopeRedirect
{
public:
	ScopeRedirect(std::ostream & ostream, const string & filename);
	
	ScopeRedirect(const ScopeRedirect & ) = delete;
	ScopeRedirect& operator=(const ScopeRedirect & ) = delete;

	~ScopeRedirect();

private:
	std::ofstream		out;
	std::ostream &		ostream;
	std::streambuf *	oldBuffer = nullptr;
};