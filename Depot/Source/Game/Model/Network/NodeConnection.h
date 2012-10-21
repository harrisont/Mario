#pragma once

#include <Game/Model/Network/Id.h>

namespace Ting
{
namespace Network
{

class NodeConnection
{
public:
	NodeConnection(Id destination)
		: m_destination(destination)
	{
	}

private:
	Id m_destination;
};

} // namespace Network
} // namespace Ting