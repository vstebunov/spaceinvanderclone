Engine = {}

function Engine.load()
	Engine.smoke_image = love.graphics.newImage("bullet.png");
	Engine.smoke = love.graphics.newParticleSystem(Bang.smoke_image, 35);
	Engine.smoke:setEmissionRate(50);
	Engine.smoke:setSpeed(50,4);
	Engine.smoke:setSize(0.6,0.6);
	Engine.smoke:setColor(255,255,255,255,0,255,255,0)
	Engine.smoke:setLifetime(2);
	Engine.smoke:setParticleLife(1);
	Engine.smoke:setDirection(40);
	Engine.smoke:setSpread(20);
	Engine.smoke:stop();
end

function Engine.update(dt)
	Engine.smoke:start();
	Engine.smoke:update(dt);
end

function Engine.draw()
	love.graphics.draw( Engine.smoke, Shuttle.x+32, Shuttle.y+64 )
end
