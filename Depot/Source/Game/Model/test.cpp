#include "test.h"
#include <SFML/Graphics.hpp>
#include <Core/Assert/Assert.h>
#include <Core/Assert/AssertHandlers.h>

class Foo
{
public:
	static void Bar(int x){
	TING_ASSERT_MESSAGE(x > 0, "x <%d> must be positive", x);
	}
};

int main(int /*argc*/, char* /*argv*/[])
{
	Ting::Core::Assert::SetHandler(Ting::Core::Assert::MessageBoxHandler);
	Foo::Bar(0);

	sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

	return 0;
}