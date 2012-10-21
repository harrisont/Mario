#include <game/model/network/Node.h>

namespace Ting
{

class NodeTest
{
public:
	void TestSendMessage()
	{
		Network::Id id1("Node1", Network::Ip(), Network::Port());
		Network::Id id2("Node2", Network::Ip(), Network::Port());

		Network::Node node1(id1);
		Network::Node node2(id2);

		node1.ConnectNode(node2.GetId());

		class MessageRecievedListener : public Network::Node::IMessageRecievedListener
		{
		public:
			void MessageRecieved(const Network::Id& /*from*/, const Network::Message& /*message*/) override
			{
				// TODO
			}
		};

		auto node1MessageRecievedListener = std::make_shared<MessageRecievedListener>();
		auto node2MessageRecievedListener = std::make_shared<MessageRecievedListener>();

		node1.AddMessageReceivedListener(node1MessageRecievedListener);
		node2.AddMessageReceivedListener(node2MessageRecievedListener);

		node1.SendMessage(node2.GetId(), Network::Message("node1 -> node2"));

//#error Verify that the message was received.
//#error Measure the time the message took to arrive.
//		node2.SendMessage(node1, "node2 -> node1");
//#error Verify that the message was received.
//#error Measure the time the message took to arrive.
//
//		connection.SimulateLatency(Time::Milliseconds(500));
//		
//		node1.SendMessage(node2, "node1 -> node2");
//#error Verify that the message was received.
//#error Measure the time the message took to arrive.
//		node2.SendMessage(node1, "node2 -> node1");
//#error Verify that the message was received.
//#error Measure the time the message took to arrive.
	}
	
	void TestRemoveMessageReceivedListener()
	{
	}
};

class SimulatedNetworkConditionsTest
{
public:
	void TestDeadConnection()
	{
	}

	void TestLatency()
	{
	}
	
	void TestDroppedPackets()
	{
	}
	
	void TestReorderedPackets()
	{
	}
};

} // namespace Ting