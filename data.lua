require("prototypes.entity")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.tile")
require("prototypes.input")

local t1default = {{-3.8, -3.8}, {3.8, 3.8}}
local t2default = {{-5.8, -5.8}, {5.8, 5.8}}
local t3default = {{-7.8, -7.8}, {7.8, 7.8}}

-- Space Factory 1
local spaceFactory1 = "space-factory-1"
local spaceFactory1_map_color = --[[ Maroon #800000 ]] { 0.5, 0.0, 0.0 }
tier_1_factory(spaceFactory1, spaceFactory1_map_color,t1default)

tile_prototype(spaceFactory1, spaceFactory1_map_color,space_floor_mask())

-- Space Factory 2
local spaceFactory2 = "space-factory-2"
local spaceFactory2_map_color = --[[ Dark Cyan #008B8B ]] { 0.0, 0.545, 0.545 }
tier_2_factory(spaceFactory2, spaceFactory2_map_color,t2default)

tile_prototype(spaceFactory2, spaceFactory2_map_color,space_floor_mask())

-- Space Factory 3
local spaceFactory3 = "space-factory-3"
local spaceFactory3_map_color = --[[ Dark Khaki #BDB76B ]] { 0.741, 0.718, 0.42 }
tier_3_factory(spaceFactory3, spaceFactory3_map_color,t3default)

tile_prototype(spaceFactory3, spaceFactory3_map_color,space_floor_mask())


-- Grav Factory 1
local gravFactory1 = "grav-factory-1"
local gravFactory1_map_color = --[[ IDFK ]] { 0.55, 0.7, 0.8 }
tier_1_factory(gravFactory1, gravFactory1_map_color,t1default)

tile_prototype(gravFactory1, gravFactory1_map_color,gravity_floor_mask())

-- Grav Factory 2
local gravFactory2 = "grav-factory-2"
local gravFactory2_map_color = --[[ IDFK ]] { 0.55, 0.7, 0.8 }
tier_2_factory(gravFactory2, gravFactory2_map_color,t2default)

tile_prototype(gravFactory2, gravFactory2_map_color,gravity_floor_mask())

-- Grav Factory 3
local gravFactory3 = "grav-factory-3"
local gravFactory3_map_color = --[[ IDFK ]] { 0.55, 0.7, 0.8 }
tier_3_factory(gravFactory3, gravFactory3_map_color,t3default)

tile_prototype(gravFactory3, gravFactory3_map_color,gravity_floor_mask())
-- Space GravFactory 1
--[[
local gravFactory1 = "gravity-factory-1"
factory_prototype("grav-Factory-1",
    { r = 0.55, g = 0.7, b = 0.8 }, tier_2_factory)
]]

-- Space GravFactory 2 TODO
--[[
factory_prototype("space-factory-3",
    { r = 0.55, g = 0.7, b = 0.8 }, tier_3_factory)
]]
