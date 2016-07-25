#include "test.h"
#include <SFML/Graphics.hpp>
#include <Core/Assert/Assert.h>
#include <Core/Assert/AssertHandlers.h>

int main(int /*argc*/, char* /*argv*/[])
{
	Ting::Core::Assert::SetHandler(Ting::Core::Assert::MessageBoxHandler);

	sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
	sf::CircleShape shape(100.f);
	shape.setFillColor(sf::Color::Green);

	sf::Texture texture;
	if (!texture.loadFromFile("sprites.png"))
	{
		TING_ASSERT_FAIL("Failed to load texture");
	}
	sf::Sprite sprite(texture);

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
		window.draw(sprite);
		window.display();
	}

	return EXIT_SUCCESS;
}