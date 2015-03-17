enemys = {}

Enemy = { 
		x = 0, 
		y = 0, 
		speed = 1.2, 
		limit = 10,
		regeneration_counter = 0,
		regeneration_speed = 300
	}

function Enemy.load()
	Enemy.image = love.graphics.newImage("bomb.png");
	Enemy.width = Enemy.image:getWidth();
	Enemy.height = Enemy.image:getHeight();

end

function Enemy.draw()
	for i,enemy in ipairs(enemys) do
		love.graphics.draw( Enemy.image, enemy.x, enemy.y );
	end
end

function Enemy.update()
	for i,enemy in ipairs(enemys) do
		enemy.y = enemy.y + Enemy.speed;
		if (enemy.y > love.graphics.getHeight()) then
			table.remove(enemys, i);
		end
		Enemy.checkShuttleCollide(enemy,i);
		Enemy.checkViolentCollide(enemy,i);
		Enemy.checkBulletCollide(enemy,i);
	end
	random = math.random(7);
	if (Enemy.limit > #enemys and 
		3 == random and 
		0 >= Enemy.regeneration_counter) then
		Enemy.start();
		Enemy.regeneration_counter = Enemy.regeneration_speed
	else
		Enemy.regeneration_counter = Enemy.regeneration_counter - 1;
	end
end

function Enemy.checkShuttleCollide(enemy,i)
	if (enemy.y >= Shuttle.y and 
			enemy.y < (Shuttle.y + Shuttle.height ) and
			( (enemy.x > Shuttle.x and	
			   enemy.x < (Shuttle.x + Shuttle.width)) or
			  ( (enemy.x + Enemy.width) > Shuttle.x and
			    (enemy.x + Enemy.width) < (Shuttle.x + Shuttle.width)))) then
	Shuttle.crush();
	newBang( enemy.x, enemy.y);
	table.remove(enemys,i);
	return
	end
end

function Enemy.checkViolentCollide(enemy,enemy_index)
	for violent_index,violent in ipairs(violents) do
	if (enemy.y >= violent.y and 
			( (enemy.x > violent.x and	
			   enemy.x < (violent.x + Violent.width)) or
			  ( (enemy.x + Enemy.width) > violent.x and
			    (enemy.x + Enemy.width) < (violent.x + Violent.width)))) then
	Violent.crush(violent, violent_index);
	newBang( enemy.x, enemy.y);
	table.remove(enemys,enemy_index);
	return
	end
	end
end
	
function Enemy.checkBulletCollide(enemy,enemy_index)
	for bullet_index,bullet in ipairs(bullets) do
	if ( enemy.y < bullet.y and 
		enemy.y + Enemy.height > bullet.y ) then
			if ( enemy.x < (bullet.x + Bullet.width) and
				enemy.x + Enemy.height > bullet.x ) then
				newBang( bullet.x, bullet.y);
				Bullet.crush(bullet, bullet_index);
				table.remove(enemys,enemy_index);
				Score = Score + 1
				Enemy.regeneration_speed = Enemy.regeneration_speed - 9;
				if (0 > Enemy.regeneration_speed) then
					Enemy.regeneration_speed = 0
				end
				return
			end
	end
	end
end
function Enemy.start()
	local enemy= {};
	enemy.y = 10;
	enemy.x = math.random( love.graphics.getWidth() - Enemy.width * 2 ) + (Enemy.width / 2);
	table.insert( enemys, enemy);
end
