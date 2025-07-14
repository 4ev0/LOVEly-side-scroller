local Shit = require("lib/shit")

local Player = {}
Player.__index = Player

local previous_position = {x = 0, y = 0}
local direction = {x = 0, y = 0}

function Player:new(x, y, sprite_path)
	local obj = {
		x = x or 0,
		y = y or 0,
		sprite = love.graphics.newImage(sprite_path),
		speed = 50
	}
	setmetatable(obj, self)
	return obj
end

function Player:update(dt)
	direction = Shit.normalize(Shit.get_direction())
	print(Shit.normalize(direction).x, Shit.normalize(direction).y)

	self.x = self.x + (direction.x * self.speed * dt)
	self.y = self.y + (direction.y * self.speed * dt)

	previous_position.x = self.x
	previous_position.y = self.y
end

function Player:draw()
	love.graphics.draw(self.sprite, self.x, self.y)
end


return Player