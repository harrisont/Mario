#pragma once

#include "Assert.h"

namespace Ting { namespace Core { namespace Assert
{

FailBehavior MessageBoxHandler(
	_In_opt_ const char* condition,
	_In_ const char* file,
	const unsigned int line,
	_In_opt_ const char* functionSignature,
	_In_opt_ const char* message);

} } } // namespace Ting::Core::Assert