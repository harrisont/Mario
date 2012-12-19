#include "MacroCommon.h"
#include <Core/Assert/Assert.h>

#include <gtest/gtest.h>

TEST(CountOf, Basic)
{
	int array[3];
	ASSERT_EQ(3, TING_COUNT_OF(array));
	TING_UNUSED(array);
}

TEST(CountOf, LengthOne)
{
	int array[1];
	ASSERT_EQ(1, TING_COUNT_OF(array));
	TING_UNUSED(array);
}
