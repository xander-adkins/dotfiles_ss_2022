local fn = vim.fn

--> Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

--> Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

--> Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")

if not status_ok then
	return
end

-- stylua: ignore
return packer.startup(function(use)
	--> System Plugins
	use("wbthomason/packer.nvim")           --> Plugin manager for Neovim
	use("nvim-lua/popup.nvim")              --> An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim")            --> All the lua functions I don't want to write twice
	use("windwp/nvim-autopairs")            --> Autopairs for neovim written by lua
	use("numToStr/Comment.nvim")            --> Smart and powerful comment plugin for neovim
	use("kyazdani42/nvim-tree.lua")         --> A file explorer tree for neovim written in lua
	use("nvim-lualine/lualine.nvim")        --> Neovim statusline plugin written in pure lua
  use ('karb94/neoscroll.nvim')           --> Smooth scrolling neovim plugin written in lua
  use ('windwp/nvim-spectre')             --> Find the enemy and replace them with dark power

  --> Tmux
  use("nathom/tmux.nvim")                 --> Seamless switching between vim splits and tmux panes

	--> Colorschemes
	use("folke/tokyonight.nvim")            --> A clean, dark Neovim theme written in Lua

	--> CMP Plugins
	use("hrsh7th/nvim-cmp")                 --> The completion plugin
	use("hrsh7th/cmp-buffer")               --> buffer completions
	use("hrsh7th/cmp-path")                 --> path completions
	use("hrsh7th/cmp-cmdline")              --> cmdline completions
	use("saadparwaiz1/cmp_luasnip")         --> snippet completions
	use("hrsh7th/cmp-nvim-lsp")             --> Nvim-cmp source for neovim builtin LSP client
	use("hrsh7th/cmp-nvim-lua")             --> Nvim-cmp source for nvim lua

	--> Snippets
	use("L3MON4D3/LuaSnip")                 --> Snippet Engine for Neovim written in Lua
	use("rafamadriz/friendly-snippets")     --> Set of preconfigured snippets for different languages

	--> LSP
	use("neovim/nvim-lspconfig")            --> Quickstart configurations for the Nvim LSP client
	use("williamboman/nvim-lsp-installer")  --> Seamlessly manage LSP servers with :LspInstall
	use("tamago324/nlsp-settings.nvim")     --> Language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim")  --> Inject LSP diagnostics, code actions, and more via Lua

	--> Telescope
	use("nvim-telescope/telescope.nvim")    --> Find, Filter, Preview, Pick. All lua, all the time

	--> Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	--> Git
	use("lewis6991/gitsigns.nvim")

	--> Automatically set up your configuration after cloning packer.nvim
	--> Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
