#include <game/model/network/Id.h>

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

private:
	Network::Id m_id;
};

} // namespace Network
} // namespace Ting