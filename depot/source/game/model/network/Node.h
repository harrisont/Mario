#pragma once

#include <game/model/network/Id.h>
#include <game/model/network/Message.h>
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

	const Network::Id& GetId() const
	{
		return m_id;
	}

	void ConnectNode(Network::Id idToConnect)
	{
		m_nodeConnections.emplace_back(idToConnect);
	}

	class IMessageRecievedListener
	{
	public:
		virtual void MessageRecieved(const Network::Id& from, const Network::Message& message) = 0;
	};

	void AddMessageReceivedListener(std::weak_ptr<IMessageRecievedListener> messageRecievedListener)
	{
		m_messageReceivedListeners.push_back(std::move(messageRecievedListener));
	}

private:
	Network::Id m_id;
	std::vector<NodeConnection> m_nodeConnections;
	std::vector<std::weak_ptr<IMessageRecievedListener>> m_messageReceivedListeners;
};

} // namespace Network
} // namespace Ting