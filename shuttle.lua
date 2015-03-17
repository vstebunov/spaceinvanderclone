Shuttle = { 
		x = 0, 
		a = 0.1, 
		max_a = 5, 
		step_a = 0.1, 
		stopper_a = 0.01,
		ammo_regenerate_counter = 1,
		ammo_regenerate_speed = 0.05, 
		lifelevel = 3
	}

function Shuttle.load()
	Shuttle.image = love.graphics.newImage("shuttle.png");
	Shuttle.sound = love.audio.newSource("METAL.mp3","static");
	Shuttle.width = Shuttle.image:getWidth();
	Shuttle.height = Shuttle.image:getHeight();
	Shuttle.y = violents[1].y - 10 - Shuttle.height;
end

function Shuttle.draw()
	love.graphics.draw( Shuttle.image, Shuttle.x, Shuttle.y );
end

function Shuttle.update()
	Shuttle.x = Shuttle.x + Shuttle.a;
	if ( 0 ~= Shuttle.a ) then
		if ( Shuttle.a > 0 ) then
			Shuttle.a = Shuttle.a - ( Shuttle.stopper_a );
		end
		if ( Shuttle.a < 0 ) then
			Shuttle.a = Shuttle.a + ( Shuttle.stopper_a );
		end
	end 
	if ((Shuttle.x + Shuttle.width) > love.graphics.getWidth()) then
		Shuttle.x = 0;
	end
	if (Shuttle.x < 0) then
		Shuttle.x = love.graphics.getWidth()-Shuttle.width-1;
	end
	if ( 1 > Shuttle.ammo_regenerate_counter ) then
		Shuttle.ammo_regenerate_counter = 
			Shuttle.ammo_regenerate_counter + Shuttle.ammo_regenerate_speed;
	end
end

function Shuttle.accelerate()
	if ( Shuttle.max_a > Shuttle.a ) then
		Shuttle.a = Shuttle.a + Shuttle.step_a;
	end
end

function Shuttle.stopped()
	if ( (-1) * Shuttle.max_a < Shuttle.a ) then
		Shuttle.a = Shuttle.a - Shuttle.step_a;
	end
end

function Shuttle.fire()
	if ( 1 <= Shuttle.ammo_regenerate_counter ) then
		Bullet.start( Shuttle.x, Shuttle.y );
		Shuttle.ammo_regenerate_counter = 0;
	end
end

function Shuttle.crush()
	love.audio.resume( Shuttle.sound );
	love.audio.play( Shuttle.sound );
	Shuttle.lifelevel = Shuttle.lifelevel - 1;
end
