--#region Names
local sff_1 = "space-factory-1"
local sff_2 = "space-factory-2"
local sff_3 = "space-factory-3"
local sgf_1 = "grav-factory-1"
local sgf_2 = "grav-factory-2"
local sgf_3 = "grav-factory-3"
--#endregion

data:extend{
	-- Space Factories
	{
		type = "recipe",
		name = sff_1,
		enabled = false,
		energy_required = 30,
		ingredients = {{ "se-space-platform-scaffold", 500 }, { "se-heat-shielding", 500 }, { "substation", 10 }},
		result = sff_1 .. "-raw",
	},
	{
		type = "recipe",
		name = sff_2,
		enabled = false,
		energy_required = 45,
		ingredients = {{ "se-space-platform-scaffold", 1000 }, { "se-heat-shielding", 1000 }, { "substation", 50 }},
		result = sff_2 .. "-raw",
	},
	{
		type = "recipe",
		name = sff_3,
		enabled = false,
		energy_required = 60,
		ingredients = {{ "se-space-platform-plating", 5000 }, { "se-heat-shielding", 2000 }, { "substation", 100 }},
		result = sff_3 .. "-raw",
	},

	-- Grav Factories
	{
		type = "recipe",
		name = sgf_1,
		enabled = false,
		energy_required = 30,
		ingredients = {{"se-space-platform-plating", 500}, { "se-heat-shielding", 500 }, { "substation", 10 }},
		result = sgf_1 .. "-raw",
	},
	{
		type = "recipe",
		name = sgf_2,
		enabled = false,
		energy_required = 45,
		ingredients = {{"se-space-platform-plating", 1000}, { "se-heat-shielding", 1000 }, { "substation", 50 }},
		result = sgf_2 .. "-raw",
	},
	{
		type = "recipe",
		name = sgf_3,
		enabled = false,
		energy_required = 60,
		ingredients = {{"se-space-platform-plating", 5000}, { "se-heat-shielding", 2000 }, { "substation", 100 }},
		result = sgf_3 .. "-raw",
	},
	-- Utilities
	{
		type = "recipe",
		name = "factory-circuit-connector",
		enabled = false,
		energy_required = 1,
		ingredients = {{"electronic-circuit", 2}, {"copper-cable", 5}},
		result = "factory-circuit-connector"
	}
}