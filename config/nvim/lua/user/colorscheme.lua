local colorscheme = "tokyonight"
local v = vim.g

--> Tokyo Night Config
-- stylua: ignore start
v.tokyonight_style = "night"                      --> The theme comes in three styles, storm, a darker variant night and day.
v.tokyonight_terminal_colors = true               --> Configure the colors used when opening a :terminal in Neovim
v.tokyonight_italic_comments = true               --> Make comments italic
v.tokyonight_italic_keywords = true               --> Make keywords italic
v.tokyonight_italic_functions = false             --> Make functions italic
v.tokyonight_italic_variables = false             --> Make variables and identifiers italic
v.tokyonight_transparent = false                  --> Enable this to disable setting the background color
v.tokyonight_hide_inactive_statusline = false     --> Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
v.tokyonight_sidebars = { "terminal", "packer" }  --> Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
v.tokyonight_transparent_sidebar = false          --> Sidebar like windows like NvimTree get a transparent background
v.tokyonight_dark_sidebar = true                  --> Sidebar like windows like NvimTree get a darker background
v.tokyonight_dark_float = true                    --> Float windows like the lsp diagnostics windows get a darker background.
v.tokyonight_colors = {}                          --> You can override specific color groups to use other groups or a hex color
v.tokyonight_day_brightness = 0.3                 --> Adjusts the brightness of the colors of the Day style. Number between 0 and 1, from dull to vibrant colors
v.tokyonight_lualine_bold = false                 --> When true, section headers in the lualine theme will be bold
-- stylua: ignore end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
