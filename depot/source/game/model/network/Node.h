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
#pragma region Constructors and Destructors
	Node(Id id)
		: m_id(id)
	{
	}
#pragma endregion

#pragma region Getters
	const Id& GetId() const	{ return m_id; }
#pragma endregion

	void ConnectNode(Id idToConnect)
	{
		m_nodeConnections.emplace_back(idToConnect);
	}

	void SendMessage(const Id& destination, Message message);

#pragma region Notifications
	class IMessageRecievedListener
	{
	public:
		virtual void MessageRecieved(const Id& from, const Message& message) = 0;
	};

	void AddMessageReceivedListener(std::weak_ptr<IMessageRecievedListener> messageRecievedListener)
	{
		m_messageReceivedListeners.push_back(std::move(messageRecievedListener));
	}
#pragma endregion

private:
	Id m_id;
	std::vector<NodeConnection> m_nodeConnections;
	std::vector<std::weak_ptr<IMessageRecievedListener>> m_messageReceivedListeners;
};

} // namespace Network
} // namespace Ting