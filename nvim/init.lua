-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   init.lua                                           :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: paalexan <paalexan@student.42porto.com>    +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2024/11/06 14:00:40 by paalexan          #+#    #+#             --
--   Updated: 2024/11/06 14:27:47 by paalexan         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

-- Add the plugins folder to Lua's package.path so it can find the plugin files
local plugin_path = vim.fn.stdpath("config") .. "/?.lua"
package.path = package.path .. ";" .. plugin_path

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Function to load all plugin files with error handling
local function safe_require(module)
	local success, plugin = pcall(require, module)
	if not success then
		print("Error loading " .. module .. ":", plugin)
	end
	return plugin
end

-- Initialize external plugins with lazy.nvim
require("lazy").setup({
	safe_require("plugins.noice"),       -- Improved UI
	safe_require("plugins.nvimtree"),    -- File Explorer
	safe_require("plugins.lualine"),     -- Status Line
	safe_require("plugins.42header"),    -- 42Header with \h
	safe_require("plugins.treesitter"),  -- Code Highlights
	--safe_require("plugins.notify"),	     -- UI Notifications
})

-- Initialize local plugins
require("plugins.commenter")

-- Key bindings
vim.api.nvim_set_keymap('n', '\\f', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open FileExplorer with \f
vim.api.nvim_set_keymap('n', '\\h', ':Stdheader<CR>', { noremap = true, silent = true })      -- Put 42header with \h
vim.api.nvim_set_keymap('n', '<leader>c', ':lua add_boxed_comment()<CR>', { noremap = true, silent = true }) -- Put CommentBox with \c
