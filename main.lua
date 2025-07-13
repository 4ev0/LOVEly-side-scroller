function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	_G.main_canvas = love.graphics.newCanvas(360,180)
end

function love.draw()
	love.graphics.setCanvas(main_canvas)
	love.graphics.clear()
	love.graphics.print("hello", 100, 100)
	love.graphics.setCanvas()

	love.graphics.draw(main_canvas, 0, 0, 0, 4, 4)
end