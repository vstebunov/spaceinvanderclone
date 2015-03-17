bg = {}
function bg.load()
	bg.image = love.graphics.newImage('bg.png');
end

function bg.draw()
	love.graphics.draw( bg.image,0,0 );
end
	
