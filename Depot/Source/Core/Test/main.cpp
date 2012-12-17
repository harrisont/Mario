#include <gtest/gtest.h>

int GetZero()
{
	int x = 9;
	x -= 9;
	return x;
}

TEST(DummyTest, FailNow) {
	EXPECT_EQ(1, GetZero());
}
