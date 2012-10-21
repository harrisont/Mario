#pragma once

#include <string>

namespace Ting
{
namespace Network
{

typedef unsigned int Ip;
typedef unsigned int Port;

// Immutable
class Id
{
public:
	typedef std::string Name;

#pragma region Constructors and Destructors
	Id(const Name& name, const Ip& ip, const Port& port)
		: m_name(name)
		, m_ip(ip)
		, m_port(port)
	{
	}

	Id(Name&& name, const Ip& ip, const Port& port)
		: m_name(std::move(name))
		, m_ip(ip)
		, m_port(port)
	{
	}

	Id(const Id& other)
		: m_name(other.m_name)
		, m_ip(other.m_ip)
		, m_port(other.m_port)
	{
	}

	Id(Id&& other)
		: m_name(std::move(other.m_name))
		, m_ip(std::move(other.m_ip))
		, m_port(std::move(other.m_port))
	{
	}
#pragma endregion

#pragma region Getters
	const Name& GetName() const { return m_name; }
	const Ip& GetIp() const { return m_ip; }
	const Port& GetPort() const { return m_port; }
#pragma endregion

private:
	Name m_name;
	Ip m_ip;
	Port m_port;
};

} // namespace Network
} // namespace Ting