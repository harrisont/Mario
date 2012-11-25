#include "Assert.h"

#include <cstdio>
#include <cstdarg>

namespace Ting { namespace Core { namespace Assert
{

namespace
{
	FailBehavior DefaultHandler(
		const char* condition,
		const char* file,
		const int line,
		const char* message)
	{
		std::printf("%s(%d): Assertion Failure: ", file, line);

		if (condition != nullptr)
			std::printf("'%s' ", condition);

		if (message != nullptr)
			std::printf("%s", message);

		std::printf("\n");

		return Halt;
	}

	Handler& GetAssertHandlerInstance()
	{
		static Handler s_handler = &DefaultHandler;
		return s_handler;
	}
}

Handler GetHandler()
{
	return GetAssertHandlerInstance();
}

void SetHandler(Handler newHandler)
{
	GetAssertHandlerInstance() = newHandler;
}

FailBehavior ReportFailure(
	const char* condition,
	const char* file,
	const int line,
	const char* messageWithFormatSpecifiers, ...)
{
	const char* message = nullptr;
	if (messageWithFormatSpecifiers != nullptr)
	{
		char messageBuffer[1024];
		{
			va_list args;
			va_start(args, messageWithFormatSpecifiers);
			vsnprintf_s(messageBuffer, 1024, messageWithFormatSpecifiers, args);
			va_end(args);
		}

		message = messageBuffer;
	}

	return GetAssertHandlerInstance()(condition, file, line, message);
}

} } } // namespace Ting::Core::Assert