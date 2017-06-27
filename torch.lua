minetest.register_abm({
	nodenames = {"torched:ground_borer"},
	interval = 0.00001, -- Run every 0.1 seconds
	chance = 1, -- Select every 1 in 1 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
    --[[
    local xpos = pos.x + math.random(-5, 5)
    local zpos = pos.z + math.random(-5, 5)
		local ypos1 = pos.y -1
		local ycounter = ypos - 1
    --]]
    local yHeight = pos.y
    local dugNodes = {}
    local startX = pos.x -6
    local startZ = pos.z -6
    local currentX = startX
    local currentZ = startZ
    local scannedNodes = 0
    local scannedX = 0
    local scannedZ = 0
    repeat
      yHeight = yHeight - 1
      if scannedNodes < 121 then
        repeat
          currentX = currentX - 1
          nodePos = {currentX, yHeight, currentZ}
          minetest.get_node(nodePos)
          table.insert(dugNodes, node.name)
          minetest.set_node(nodePos, "air")
          scannedNodes = scannedNodes + 1
        until scannedX == 11
        if scannedX == 11 then

          if currentZ == 11 then
          else
            currentZ = currentZ + 1
          end
        end
      end
    until yHeight == -64

		minetest.set_node({x = xpos, y = ypos - 1, z = zpos}, {name = "air"})
	end
})

minetest.register_node("torched:ground_borer", {
	description = "Borer Torch",
	tiles = {"torched_ground_borer"},
	groups = {cracky=3, stone=1}
})

--[[
minetest.register_abm({
	nodenames = {"eden:torch"},
	neighbors = {"soil:dirt_with_grass" or "eden:stone" or "soil:dirt"},
	interval = 0.00001, -- Run every 0.1 seconds
	chance = 1, -- Select every 1 in 1 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
    local xpos = pos.x + math.random(-5, 5)
    local zpos = pos.z + math.random(-5, 5)
		local ypos = pos.y + math.random(-1, -10)
		minetest.set_node({x = xpos, y = ypos - 1, z = zpos}, {name = "air"})
	end
})
--]]
