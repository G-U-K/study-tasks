#include "ScopeRedirect.h"

ScopeRedirect::ScopeRedirect(std::ostream & ostream, const string & filename)
	: ostream(ostream)
{
	out.open(filename);
	if (!out.is_open())
	{
		std::cerr << "Cannot open file!" << std::endl;
	}
	else
	{
		oldBuffer = ostream.rdbuf(); //save old buf
		ostream.rdbuf(out.rdbuf());
	}
}

ScopeRedirect::~ScopeRedirect()
{
	ostream.rdbuf(oldBuffer);
}
