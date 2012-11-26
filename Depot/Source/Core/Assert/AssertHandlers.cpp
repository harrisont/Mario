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
	std::stringstream title("Assertion Failure");

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
		title.str().c_str(),
		MB_ABORTRETRYIGNORE | MB_ICONERROR /*uType*/);

	if (messageBoxCloseResult == IDIGNORE)
		return FailBehavior::Continue;
	else
		return FailBehavior::Halt;
}

} } } // namespace Ting::Core::Assert
