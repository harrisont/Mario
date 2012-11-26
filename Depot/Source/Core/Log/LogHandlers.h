#pragma once

#include "Log.h"

namespace Ting { namespace Core { namespace Log
{

void MessageBoxHandler(
	_In_ const char* file,
	const unsigned int line,
	_In_ const char* functionSignature,
	_In_opt_ const char* message);

} } } // namespace Ting::Core::Log