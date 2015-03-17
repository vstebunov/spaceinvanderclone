violents = {}

Violent = {
	x = 0,
	y = 0,
	lifelevel = 3,
	count = 5 
	}

function Violent.load()
	Violent.health = {}
	Violent.health[3] =love.graphics.newImage("violent.png");
	Violent.health[2] =love.graphics.newImage("violent_2.png");
	Violent.health[1] =love.graphics.newImage("violent_1.png");
	Violent.width = Violent.health[3]:getWidth();
	for i=1,Violent.count do
		local violent = {};
		violent.x = i * 128 - 25;
		violent.y = love.graphics.getHeight() - Violent.width - 10;
		violent.lifelevel = Violent.lifelevel;
		table.insert( violents, violent);
	end
end

function Violent.draw()
	for _,violent in ipairs(violents) do
		love.graphics.draw( Violent.health[ violent.lifelevel ], 
			violent.x, violent.y);
	end
end

function Violent.crush(self, violent_index)
	self.lifelevel = self.lifelevel -1;
	if ( 0 >= self.lifelevel ) then
		table.remove( violents, violent_index);
	end
end

function Violent.update()
end
