#pragma once

#include <game/model/network/Id.h>

namespace Ting
{
namespace Network
{

class NodeConnection
{
public:
	NodeConnection(Network::Id destinationId)
		: m_destinationId(destinationId)
	{
	}

private:
	Network::Id m_destinationId;
};

} // namespace Network
} // namespace Ting