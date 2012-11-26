#include "Assert.h"

#include <cstdarg>
#include <cstdio>
#include <stdlib.h>

namespace Ting { namespace Core { namespace Assert
{

namespace
{
	FailBehavior DefaultHandler(
		_In_opt_ const char* condition,
		_In_ const char* file,
		const unsigned int line,
		_In_opt_ const char* functionSignature,
		_In_opt_ const char* message)
	{
		std::printf("%s (%s:%u): Assertion Failure: ", functionSignature, file, line);

		if (condition != nullptr)
			std::printf("'%s' ", condition);

		if (message != nullptr)
			std::printf("%s", message);

		std::printf("\n");

		return FailBehavior::Abort;
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
	_In_opt_ const char* condition,
	_In_ const char* file,
	const unsigned int line,
	_In_opt_ const char* functionSignature,
	_In_opt_ const char* messageWithFormatSpecifiers, ...)
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

	return GetAssertHandlerInstance()(condition, file, line, functionSignature, message);
}

} } } // namespace Ting::Core::Assert