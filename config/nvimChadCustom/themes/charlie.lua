local M = {}

M.base_30 = {
	white = "#ced4df",
	darker_black = "#05080e",
	black = "#0B0E14",
	black2 = "#14171d",
	one_bg = "#1c1f25",
	one_bg2 = "#24272d",
	one_bg3 = "#2b2e34",
	grey = "#33363c",
	grey_fg = "#3d4046",
	grey_fg2 = "#46494f",
	light_grey = "#54575d",
	red = "#F07178",
	baby_pink = "#ff949b",
	pink = "#ff8087",
	line = "#24272d",
	green = "#AAD84C",
	vibrant_green = "#b9e75b",
	blue = "#36A3D9",
	nord_blue = "#43b0e6",
	yellow = "#E7C547",
	sun = "#f0df8a",
	purple = "#c79bf4",
	dark_purple = "#A37ACC",
	teal = "#74c5aa",
	orange = "#ffa455",
	cyan = "#95E6CB",
	statusline_bg = "#12151b",
	lightbg = "#24272d",
	pmenu_bg = "#ff9445",
	folder_bg = "#98a3af",
}

M.base_16 = {
	base00 = "#1D212A",
	base01 = "#444A52",
	base02 = "#263A55",
	base03 = "#667587",
	-- TODO: 04 - 07
	base04 = "#33363c",
	base05 = "#c9c7be",
	base06 = "#E6E1CF",
	base07 = "#D9D7CE",

	base08 = "#C4C2B9",
	--TODO: 0
	base09 = "#FFEE99",

	base0A = "#FFA35B",
	base0B = "#CFFF75",
	base0C = "#FFB454",

	base0D = "#FFCB68",
	base0E = "#68CAFF",

	base0F = "#CBA6F7",
}

M.polish_hl = {
	luaTSField = { fg = M.base_16.base0D },
	["@tag.delimiter"] = { fg = M.base_30.cyan },
	["@function"] = { fg = "#FFCB68" },
	-- ["@punctuation.bracket"] = { fg = "#D565D0" },
	["@parameter"] = { fg = M.base_16.base0F },
	-- ["@constructor"] = { fg = "#68CAFF" },
	["@tag.attribute"] = { fg = M.base_30.orange },
	["@type.builtin"] = { fg = "#FFA35B" },
	-- ["@attribute"] = { fg = "#68CAFF" },
	["Type"] = { fg = "#68CAFF" },

	-- ["@type.builtin"] = { fg = "#68CAFF" },
}
M = require("base46").override_theme(M, "charlie")

M.type = "dark"

return M
