#pragma once

#include <game/model/network/Id.h>
#include <game/model/network/NodeConnection.h>

#include <memory>
#include <vector>

namespace Ting
{
namespace Network
{

class Node
{
public:
	Node(Network::Id::Name name)
		: m_id(name)
	{
	}

	Network::Id GetId()
	{
		return m_id;
	}

	void ConnectNode(Network::Id idToConnect)
	{
		m_nodeConnections.emplace_back(idToConnect);
	}

private:
	Network::Id m_id;
	std::vector<NodeConnection> m_nodeConnections;
};

} // namespace Network
} // namespace Ting