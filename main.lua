require('shuttle.lua');
require('bullet.lua');
require('enemy.lua');
require('violent.lua');
require('bang.lua');
require('engine.lua');
require('bg.lua');

Score = 0;
is_paused = false;
show_start_menu = true;

function love.load()
	bg.load();
	Bang.load();
	Bullet.load();
	Enemy.load();
	Violent.load();
	Shuttle.load();
	Engine.load();
end

function love.draw()
	bg.draw();
	if show_start_menu then
		love.graphics.print( "Clone Space Invander", 50, 50 );
		love.graphics.print( "You control rocket.", 50, 80 );
		love.graphics.print( "Left arrow - Left.", 50, 90 );
		love.graphics.print( "Right arrow - Right.", 50, 100 );
		love.graphics.print( "Space - Fire.", 50, 110 );
		love.graphics.print( "p - Pause.", 50, 120 );
		love.graphics.print( "Press SPACE for play.", 50, 130 );
		love.graphics.print( "Current score" .. Score, 50, 190 );
		return
	end
	love.graphics.print("Shuttle.lifelive:" .. Shuttle.lifelevel,10,10);
	love.graphics.print("fps:" .. love.timer.getFPS(),10,40);
	love.graphics.print("score:" .. Score,10,70);
	Bullet.draw()
	Enemy.draw()
	Engine.draw()
	Shuttle.draw()
	Violent.draw()
	Bang.draw()
end

function love.update(dt)
	if (show_start_menu) then
		if (love.keyboard.isDown(" ")) then
			Shuttle.lifelevel = 3;
			violents = {};
			Violent.load();
			show_start_menu = false
		end
		return
	end
	if love.keyboard.isDown("p") then
		is_paused = not is_paused;
		return
	end
	if (is_paused) then
		return
	end
	if ( 0 == Shuttle.lifelevel or 0 == #violents ) then
		game_over()
	end
	if love.keyboard.isDown("right") then
		Shuttle.accelerate();
	end
	if love.keyboard.isDown("left") then
		Shuttle.stopped();
	end
	if love.keyboard.isDown(" ") then
		Shuttle.fire();
	end
	Shuttle.update();
	Engine.update(dt);
	Bullet.update();
	Enemy.update();
	Violent.update();
	Bang.update(dt);
end

function game_over()
	show_start_menu = true;
end
