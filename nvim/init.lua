---------------------------
-- Lazy | Plugin Manager --
---------------------------

-- Add the plugins folder to Lua's package.path so it can find the plugin files
local plugin_path = vim.fn.stdpath("config") .. "/plugins/?.lua"
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

-- Function to load all plugin files
local function load_plugins()
  require("lazy").setup({
    require("plugins.noice"),    -- Noice plugin
    require("plugins.nvimtree"), -- NvimTree plugin
    require("plugins.lualine"),  -- Lualine plugin
  })
end

-- Initialize plugins
load_plugins()

-- Binds
vim.api.nvim_set_keymap('n', '\\f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

