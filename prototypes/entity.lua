local local_prefix = "__space-factorissimo-updated__"
local factorissimo_prefix = '__factorissimo-2-notnotmelon__';

require("circuit-connector-sprites")

local function blank()
    return {
        filename = factorissimo_prefix .. "/graphics/nothing.png",
        priority = "high",
        width = 1,
        height = 1,
    }
end

local function ablank()
    return {
        filename = factorissimo_prefix .. "/graphics/nothing.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1,
    }
end

local function spacefactory_collision_mask()
    return {
        "water-tile",
        "ground-tile",
        "item-layer",
        "object-layer",
        "player-layer",
    }
end

local function factory_prototype(name, map_color, factory_default)
    data:extend({
        {
            type = "storage-tank",
            name = name,
            --localised_name = { "entity-name." .. name },
            icon = local_prefix .. "/graphics/icon/" .. name .. ".png",
            icon_size = 64,
            flags = { "player-creation" },
            mineable = { mining_time = 5, result = name, count = 1 },
            max_health = 5000,
            collision_box = factory_default.source_rect,
            selection_box = factory_default.source_rect,
            collision_mask = spacefactory_collision_mask(),
            se_allow_in_space = true,
            vehicle_impact_sound = { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
            pictures = {
                picture = {
                    layers = {
                        {
                            filename = local_prefix .. "/graphics/factory/" .. name .. "-shadow.png",
                            width = factory_default.width,
                            height = factory_default.height,
                            shift = factory_default.shift,
                            draw_as_shadow = true
                        },
                        {
                            filename = local_prefix .. "/graphics/factory/" .. name .. ".png",
                            width = factory_default.width,
                            height = factory_default.height,
                            shift = factory_default.shift,
                        }
                    }
                },
                fluid_background = blank(),
                window_background = blank(),
                flow_sprite = blank(),
                gas_flow = ablank()
            },
            window_bounding_box = { { 0, 0 }, { 0, 0 } },
            fluid_box = {
                base_area = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections = {},
            },
            flow_length_in_ticks = 1,
            circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
            circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
            circuit_wire_max_distance = 0,
            map_color = map_color,
            is_military_target = true
        },
        {
            type = "item-with-tags",
            name = name,
            --localised_name = { "entity-name." .. name },
            icon = local_prefix .. "/graphics/icon/" .. name .. ".png",
            icon_size = 64,
            subgroup = "factorissimo2",
            order = "a-c",
            place_result = name,
            stack_size = 1
        },
        {
            type = "item",
            name = name,
            --localised_name = { "entity-name." .. name },
            icon = local_prefix .. "/graphics/icon/" .. name .. ".png",
            icon_size = 64,
            subgroup = "factorissimo2",
            order = "a-c",
            place_result = name,
            stack_size = 1,
		flags = {'primary-place-result'}
        }
    })
end

function tier_1_factory(name)
    map_color = { r = 1, g = 0.7, b = 0.55 }
    defaults = {
        source_rect = { { -3.8, -3.8 }, { 3.8, 3.8 } },
        width = 416,
        height = 320,
        shift = { 1.5, 0 }
    }
    factory_prototype(name, map_color, defaults)
end

function tier_2_factory(name)
    map_color = { r = 0.8, g = 0.7, b = 0.1 }
    defaults = {
        source_rect = { { -5.8, -5.8 }, { 5.8, 5.8 } },
        width = 544,
        height = 448,
        shift = { 1.5, 0 }
    }

    factory_prototype(name, map_color, defaults)
end

function tier_3_factory(name)
    map_color = { r = 0.85, g = 0.85, b = 0.2 }
    defaults = {
        source_rect = { { -7.8, -7.8 }, { 7.8, 7.8 } },
        width = 704,
        height = 608,
        shift = { 2, -0.09375 }
    }
    factory_prototype(name, map_color, defaults)
end
