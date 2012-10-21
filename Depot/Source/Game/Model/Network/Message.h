#pragma once

#include <string>

namespace Ting
{
namespace Network
{

// Immutable
class Message
{
public:
	typedef std::string Content;

#pragma region Constructors and Destructors
	Message(const Content& content)
		: m_content(content)
	{
	}

	Message(Content&& content)
		: m_content(std::move(content))
	{
	}
#pragma endregion

	const Content& GetContent() const { return m_content; }

private:
	const Content m_content;

	Message& operator=(const Message& other);
};

} // namespace Network
} // namespace Ting