#include "LogHandlers.h"

#include <sstream>
#include <Windows.h>

namespace Ting { namespace Core { namespace Log
{

void MessageBoxHandler(
	_In_ const char* file,
	const unsigned int line,
	_In_ const char* functionSignature,
	_In_opt_ const char* message)
{
	std::stringstream text;

	if (message != nullptr)
		text << message;

	text << "\n\n" << file << " line " << line
		<< "\n" << functionSignature;

	::MessageBox(
		nullptr /*hWnd*/,
		text.str().c_str(),
		"Log Message" /*lpCaption*/,
		MB_OK | MB_ICONINFORMATION /*uType*/);
}

} } } // namespace Ting::Core::Log
