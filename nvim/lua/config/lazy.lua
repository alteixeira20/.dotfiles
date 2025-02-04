-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load lazy.nvim and setup plugins
require("lazy").setup({
	spec = {
		{
			{ import = "plugins/core" },
			{ import = "plugins/ui" },
		}
	},
	install = { colorscheme = { "habamax" } }, -- Default colorscheme during setup
	checker = { enabled = true }, -- Automatically check for updates
	ui = {
		border = "rounded", -- Rounded borders for Lazy.nvim UI
	},
})

local notify = require("notify")
vim.notify = notify
