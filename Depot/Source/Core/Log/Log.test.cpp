#include "Log.h"

#include <gtest/gtest.h>
#include <string>

namespace Ting { namespace Core { namespace Log
{

class LogTest : public ::testing::Test
{
public:
	static void LogHandler(
		_In_ const char* file,
		const unsigned int line,
		_In_ const char* functionSignature,
		_In_ const char* message)
	{
		sFile = file;
		sLine = line;
		sFunctionSignature = functionSignature;
		sMessage = message;
	}

protected:
	void SetUp() override
	{
		SetHandler(&LogHandler);
	}

	static std::string sFile;
	static unsigned int sLine;
	static std::string sFunctionSignature;
	static std::string sMessage;
};

std::string LogTest::sFile;
unsigned int LogTest::sLine = 0;
std::string LogTest::sFunctionSignature;
std::string LogTest::sMessage;

TEST_F(LogTest, LogWorks)
{
	const int x = -5;
	const unsigned int y = 6;

	std::string file = "file";
	unsigned int line = 12345;
	std::string functionSignature = "function-signature";
	std::string messageWithFormatSpecifiers = "x=%d, y=%u";
	char messageBuffer[100] = "";
	sprintf_s(messageBuffer, TING_COUNT_OF(messageBuffer), messageWithFormatSpecifiers.c_str(), x, y);

	Log(
		file.c_str(),
		line,
		functionSignature.c_str(),
		messageWithFormatSpecifiers.c_str(),
		x,
		y);

	EXPECT_EQ(file, sFile);
	EXPECT_EQ(line, sLine);
	EXPECT_EQ(functionSignature, sFunctionSignature);
	EXPECT_EQ(messageBuffer, sMessage);
}

} } } // namespace Ting::Core::Assert
