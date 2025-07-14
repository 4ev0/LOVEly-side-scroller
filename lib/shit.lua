local Shit = {}

function Shit.clamp(value, lower, upper)
	return math.max(lower, math.min(value, upper))
end

-- vectors

function Shit.get_direction(left, right, up, down)
	left = left or "a"
	right = right or "d"
	up = up or "w"
	down = down or "s"
	local direction = {x = 0, y = 0}
	local l_down, r_down = love.keyboard.isDown(left), love.keyboard.isDown(right)
	local u_down, d_down = love.keyboard.isDown(up), love.keyboard.isDown(down)
	direction.x = (l_down and not r_down) and -1 or (r_down and not l_down) and 1 or 0
	direction.y = (u_down and not d_down) and -1 or (d_down and not u_down) and 1 or 0
	return direction
end

function Shit.normalize(vector)
	local x,y = vector.x, vector.y
	local length = math.sqrt(x * x + y * y)
	if length > 0 then
		vector.x, vector.y = x / length, y / length
	end
	return vector
end

return Shit