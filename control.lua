require 'util'
require("scripts.layout")

local factory_layouts = {}

-- Space Factory 1
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_1_layout("space-factory-1")) end)

-- Space Factory 2
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_2_layout("space-factory-2")) end)

-- Space Factory 3
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_3_layout("space-factory-3")) end)

--Grav Factory 1
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_1_layout("grav-factory-1")) end)

-- Grav Factory 2
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_2_layout("grav-factory-2")) end)

-- Grav Factory 3
table.insert(factory_layouts, function(...) remote.call("factorissimo", "add_layout", tier_3_layout("grav-factory-3")) end)

local function add_layouts()
	for _, v in pairs(factory_layouts) do
		v()
	end
end

-- Create surfaces to be used by the factories
-- for simplicity we only use a single layout per factory type
local function create_surface(surface_name)
	local surface = game.surfaces[surface_name]
	
	if surface == nil then
        surface = game.create_surface(surface_name, {width = 2, height = 2})
        surface.daytime = 0.5
        surface.freeze_daytime = true
        if remote.interfaces["RSO"] then -- RSO compatibility
            pcall(remote.call, "RSO", "ignoreSurface", surface_name)
        end
	end
end

--script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}

script.on_init(
	function()
		create_surface("space-factory-floor")
		create_surface("grav-factory-floor")
		add_layouts()
	end)
script.on_configuration_changed(add_layouts)
