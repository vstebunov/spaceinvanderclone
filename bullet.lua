bullets = {}

Bullet = {	x = 0, 
		y = 0, 
		speed = 5,
	}

function Bullet.load()
	Bullet.image = love.graphics.newImage("bullet.png")
	Bullet.width = Bullet.image:getWidth();
	Bullet.sound = love.audio.newSource("shot.wav","static")
end

function Bullet.update()
	for i, bullet in ipairs(bullets) do
		bullet.y = bullet.y - Bullet.speed;
		if (0 >= bullet.y+Bullet.width) then
			table.remove( bullets, i );
		end 
	end
end

function Bullet.draw()
	for i=1,#bullets do
		love.graphics.draw(Bullet.image, bullets[i].x, bullets[i].y);
	end
end

function Bullet.start(x,y)
	local bullet = {}
	bullet.x = x;
	bullet.y = y;
	love.audio.resume(Bullet.sound);
	love.audio.play(Bullet.sound);
	table.insert( bullets, bullet );
end

function Bullet.crush(bullet, index)
	table.remove(bullets,index);
end
