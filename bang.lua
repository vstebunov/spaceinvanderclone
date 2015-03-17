bangs = {}
Bang = { x =0, y=0, lifetime = 200 }

function newBang(x,y)
	local bang = {};
	bang.x = x;
	bang.y = y;
	bang.lifetime = Bang.lifetime;
	bang.smoke = love.graphics.newParticleSystem(Bang.smoke_image, 35);
	bang.smoke:setEmissionRate(500);
	bang.smoke:setSpeed(-5,-14);
	bang.smoke:setSize(0.6,0.6);
	bang.smoke:setColor(255,128,128,128,0,0,0,0)
	bang.smoke:setLifetime(25);
	bang.smoke:setParticleLife(7);
	bang.smoke:setDirection(240);
	bang.smoke:setSpread(2);
	bang.smoke:stop();
	bang.smoke:start();
	table.insert( bangs, bang);
	love.audio.resume( Bang.sound );
	love.audio.play( Bang.sound );
end

function Bang.load()
	Bang.smoke_image = love.graphics.newImage("bullet.png");
	Bang.sound = love.audio.newSource("bang.wav", "static");
end

function Bang.update(dt)
	for index,bang in ipairs(bangs) do
		bang.smoke:update(dt);
		bang.lifetime = bang.lifetime - 1;
		if 0 >= bang.lifetime then
			table.remove( bangs, index);
		end
	end
end

function Bang.draw()
	for _,bang in ipairs(bangs) do
		love.graphics.draw( bang.smoke, bang.x, bang.y );
	end
end

