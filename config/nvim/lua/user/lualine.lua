local status_ok = pcall(require, "lualine")

if not status_ok then
	return
end

-- stylua: ignore
local colors = {
  blue    = '#7aa2f7',
  cyan    = '#7dcfff',
  black   = '#1c1c1c',
  white   = '#c6c6c6',
  red     = '#f7768e',
  magenta = '#bb9af7',
  grey    = '#1c1c1c',
}

local minimal_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.magenta },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

require("lualine").setup({
	options = {
		theme = minimal_theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", right_padding = 2 } },
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
