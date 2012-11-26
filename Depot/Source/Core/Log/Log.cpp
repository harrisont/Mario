#include "Log.h"

#include <cstdarg>
#include <cstdio>

namespace Ting { namespace Core { namespace Log
{

namespace
{
	void DefaultHandler(
		_In_ const char* file,
		const unsigned int line,
		_In_ const char* functionSignature,
		_In_ const char* message)
	{
		std::printf("%s (%s:%u): %s\n", functionSignature, file, line, message);
	}

	Handler& GetLogHandlerInstance()
	{
		static Handler s_handler = &DefaultHandler;
		return s_handler;
	}
}

Handler GetHandler()
{
	return GetLogHandlerInstance();
}

void SetHandler(Handler newHandler)
{
	GetLogHandlerInstance() = newHandler;
}

void Log(
	_In_ const char* file,
	const unsigned int line,
	_In_ const char* functionSignature,
	_In_ const char* messageWithFormatSpecifiers, ...)
{
	const char* message = nullptr;
	if (messageWithFormatSpecifiers != nullptr)
	{
		char messageBuffer[4096];
		{
			va_list args;
			va_start(args, messageWithFormatSpecifiers);
			vsnprintf_s(messageBuffer, sizeof(messageBuffer), messageWithFormatSpecifiers, args);
			va_end(args);
		}

		message = messageBuffer;
	}

	return GetLogHandlerInstance()(file, line, functionSignature, message);
}

} } } // namespace Ting::Core::Assert