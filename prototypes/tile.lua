require("scripts.utility")

local factorissimo_path = '__factorissimo-2-notnotmelon__'

alien_biomes_priority_tiles = alien_biomes_priority_tiles or {}

local interior_tile = collision_mask_util_extended.get_make_named_collision_mask("interior-tile")
local space_tile = collision_mask_util_extended.get_make_named_collision_mask("space-tile")
local ground_tile = collision_mask_util_extended.get_make_named_collision_mask("ground-tile")
local planet_tile = collision_mask_util_extended.get_named_collision_mask("planet-tile")


function make_tile(tinfo)
	table.insert(alien_biomes_priority_tiles, tinfo.name)
	data:extend {
		{
			type = "tile",
			name = tinfo.name,
			needs_correction = false,
			collision_mask = tinfo.collision_mask,
			layer = tinfo.layer or 50,
			variants = {
				main = tinfo.pictures,
				inner_corner = { picture = factorissimo_path .. "/graphics/nothing.png", count = 0 },
				outer_corner = { picture = factorissimo_path .. "/graphics/nothing.png", count = 0 },
				side = { picture = factorissimo_path .. "/graphics/nothing.png", count = 0 },
				u_transition = { picture = factorissimo_path .. "/graphics/nothing.png", count = 0 },
				o_transition = { picture = factorissimo_path .. "/graphics/nothing.png", count = 0 },
			},
			walking_speed_modifier = 1.3,
			walking_sound = {
				{
					filename = "__base__/sound/walking/concrete-01.ogg",
					volume = 1.2
				},
				{
					filename = "__base__/sound/walking/concrete-02.ogg",
					volume = 1.2
				},
				{
					filename = "__base__/sound/walking/concrete-03.ogg",
					volume = 1.2
				},
				{
					filename = "__base__/sound/walking/concrete-04.ogg",
					volume = 1.2
				}
			},
			map_color = tinfo.map_color or { r = 1 },
			pollution_absorption_per_second = 0.0006
		},
	}
end

function space_floor_mask()
	return {
		interior_tile,
		space_tile
	}
end

function gravity_floor_mask()
	return {
		interior_tile,
		ground_tile,
		planet_tile
	}
end

local function wall_mask()
	return {
		"ground-tile",
		"water-tile",
		"resource-layer",
		"floor-layer",
		"item-layer",
		"object-layer",
		"player-layer",
		"doodad-layer"
	}
end

local function edge_mask()
	return {
		"ground-tile",
		"water-tile",
		"resource-layer",
		"floor-layer",
		"item-layer",
		"object-layer",
		"doodad-layer"
	}
end

local function sf3fc() return { r = 100, g = 120, b = 120 } end

local function pictures_outside()
	return {
		{
			picture = "__base__/graphics/terrain/out-of-map.png",
			count = 1,
			size = 1
		},
	}
end

local function pictures_floor()
	return {
		{
			picture = factorissimo_path .. "/graphics/tile/ff_1.png",
			count = 16,
			size = 1
		},
		{
			picture = factorissimo_path .. "/graphics/tile/ff_2.png",
			count = 4,
			size = 2,
			probability = 0.39,
		},
		{
			picture = factorissimo_path .. "/graphics/tile/ff_4.png",
			count = 4,
			size = 4,
			probability = 1,
		},
	}
end

local function pictures_pattern(i)
	return {
		{
			picture = factorissimo_path .. '/graphics/tile/ff' .. i .. '_1.png',
			count = 16,
			size = 1
		},
		{
			picture = factorissimo_path .. '/graphics/tile/ff' .. i .. '_2.png',
			count = 4,
			size = 2,
			probability = 0.39,
		},
		{
			picture = factorissimo_path .. '/graphics/tile/ff' .. i .. '_4.png',
			count = 4,
			size = 4,
			probability = 1,
		},
	}
end

local function pictures_walls(i)
	return {
		{
			picture = factorissimo_path .. '/graphics/tile/fw' .. i .. '_1.png',
			count = 16,
			size = 1
		},
	}
end

make_tile({
	name = "out-of-space-factory",
	collision_mask = wall_mask(),
	layer = 70,
	pictures = pictures_outside(),
	map_color = { r = 0, g = 0, b = 0 },
})

make_tile({
	name = "space-factory-floor",
	collision_mask = space_floor_mask(),
	layer = 30,
	pictures = pictures_floor(),
	map_color = sf3fc(),
})

make_tile({
	name = "space-factory-entrance",
	collision_mask = edge_mask(),
	layer = 30,
	pictures = pictures_floor(),
	map_color = sf3fc(),
})

make_tile({
	name = "grav-factory-floor",
	collision_mask = gravity_floor_mask(),
	layer = 30,
	pictures = pictures_floor(),
	map_color = sf3fc(),
})

make_tile({
	name = "grav-factory-entrance",
	collision_mask = edge_mask(),
	layer = 30,
	pictures = pictures_floor(),
	map_color = sf3fc(),
})

function tile_prototype(name, map_color, mask)
	make_tile({
		name = name:sub(0, #name - 1) .. "pattern" .. name:sub(#name - 1, #name),
		collision_mask = mask,
		layer = 30,
		pictures = pictures_pattern(name:sub(#name, #name + 1)),
		map_color = map_color,
	})
	make_tile({
		name = name:sub(0, #name - 1) .. "wall" .. name:sub(#name - 1, #name),
		collision_mask = edge_mask(),
		layer = 30,
		pictures = pictures_walls(name:sub(#name, #name + 1)),
		map_color = map_color,
	})
end

function space_tiles(name, map_color)
	tile_prototype(name, map_color, space_floor_mask())
end

function gravity_tiles(name, map_color)
	tile_prototype(name, map_color, gravity_floor_mask())
end
