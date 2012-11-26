#pragma once

#include <Core/Macro/MacroCommon.h>

#include <sal.h>

namespace Ting { namespace Core { namespace Log
{
	typedef void (*Handler)(
		_In_ const char* file,
		const unsigned int line,
		_In_ const char* functionSignature,
		_In_ const char* message);

	Handler GetHandler();
	void SetHandler(Handler newHandler);

	void Log(
		_In_ const char* file,
		const unsigned int line,
		_In_ const char* functionSignature,
		_In_ const char* messageWithFormatSpecifiers, ...);
} } } // namespace Ting::Core::Log

#define TING_LOG(messageWithFormatSpecifiers, ...) \
	TING_MACRO_BEGIN \
		Ting::Core::Log::Log(__FILE__, __LINE__, BOOST_CURRENT_FUNCTION, (messageWithFormatSpecifiers), __VA_ARGS__); \
	TING_MACRO_END