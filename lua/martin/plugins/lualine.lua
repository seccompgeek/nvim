-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme

local colors = {
	yellow = "#FFDA7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#3EFFDC",
	orange = "#FF8800",
	violet = "#FF61EF",
	magenta = "#c678dd",
	blue = "#65D1FF",
	red = "#ec5f67",
	black = "#000000",
}
local new_colors = colors

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

local config = {
	options = {
		theme = "tokyonight",
		disabled_filetypes = {
			"packer",
			"NvimTree",
		},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
	--    theme = lualine_nightfly,
}

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_right({
	"lsp_progress",
	display_components = { "lsp_client_name", { "title", "percentage", "message" } },
	-- With spinner
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
	colors = {
		percentage = colors.cyan,
		title = colors.cyan,
		message = colors.cyan,
		spinner = colors.cyan,
		lsp_client_name = colors.magenta,
		use = true,
	},
	separators = {
		component = " ",
		progress = " | ",
		message = { pre = "(", post = ")" },
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "[", post = "]" },
		spinner = { pre = "", post = "" },
		message = { commenced = "In Progress", completed = "Completed" },
	},
	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "" } },
	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
	--spinner_symbols = { "羽", "ﮫ", "ﲊ", "羽", "ﲊ", "ﮫ", "羽", "ﮫ" },
})

-- configure lualine with modified theme
lualine.setup(config)
