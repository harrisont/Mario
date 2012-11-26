#include "AssertHandlers.h"

#include <sstream>
#include <Windows.h>

namespace Ting { namespace Core { namespace Assert
{

FailBehavior MessageBoxHandler(
	_In_opt_ const char* condition,
	_In_ const char* file,
	const unsigned int line,
	_In_opt_ const char* functionSignature,
	_In_opt_ const char* message)
{
	std::stringstream text;

	if (condition)
		text << "'" << condition << "'";

	if (message != nullptr)
		text << "\n" << message;

	text << "\n\n" << file << " line " << line;

	if (functionSignature)
		text << "\n" << functionSignature;

	int messageBoxCloseResult = ::MessageBox(
		nullptr /*hWnd*/,
		text.str().c_str(),
		"Assertion Failure" /*lpCaption*/,
		MB_ABORTRETRYIGNORE | MB_ICONERROR /*uType*/);

	if (messageBoxCloseResult == IDRETRY)
		return FailBehavior::Break;
	else if (messageBoxCloseResult == IDIGNORE)
		return FailBehavior::Continue;
	else
		return FailBehavior::Abort;
}

} } } // namespace Ting::Core::Assert
