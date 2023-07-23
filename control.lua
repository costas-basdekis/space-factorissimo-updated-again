require 'util'
require("scripts.layout")

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

function add_layout()
	if remote.interfaces["factorissimo"] then
        remote.call("factorissimo", "add_layout", tier_1_layout("space-factory-1"))
		remote.call("factorissimo", "add_layout", tier_2_layout("space-factory-2"))
		remote.call("factorissimo", "add_layout", tier_3_layout("space-factory-3"))
        remote.call("factorissimo", "add_layout", tier_1_layout("grav-factory-1"))
		remote.call("factorissimo", "add_layout", tier_2_layout("grav-factory-2"))
		remote.call("factorissimo", "add_layout", tier_3_layout("grav-factory-3"))
    end
end

script.on_init(
	function()
		init_globals()
		create_surface("space-factory-floor")
		create_surface("grav-factory-floor")
		add_layout()
	end)
script.on_configuration_changed(add_layouts)
