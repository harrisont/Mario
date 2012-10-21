#pragma once

#include <string>

namespace Ting
{
namespace Network
{

typedef unsigned int Ip;
typedef unsigned int Port;

class Id
{
public:
	typedef std::string Name;

	Name name;
	Network::Ip ip;
	Network::Port port;

	Id(Name name)
		: name(name)
	{
	}
};

} // namespace Network
} // namespace Ting