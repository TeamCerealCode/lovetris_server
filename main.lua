local sock = require "libs.sock"

local server

function love.load()
	server = sock.newServer("*", 9757)

	server:on("connect", function(data, client)
		local board = {}

		for i = 0, 20 - 1 do
			local row = {}

			for j = 0, 10 - 1 do
				row[j] = 0
			end

			board[i] = row
		end

		board[1][1] = 1

		client:send("updateBoard", board)
	end)
end

function love.update(dt)
	server:update()
end