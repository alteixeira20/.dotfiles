---------------------------
-- Lazy | Plugin Manager --
---------------------------

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
local function load_plugins()
  local success, plugin

  success, plugin = pcall(require, "plugins.noice")
  if not success then
    print("Error loading Noice:", plugin)
  end

  success, plugin = pcall(require, "plugins.nvimtree")
  if not success then
    print("Error loading NvimTree:", plugin)
  end

  success, plugin = pcall(require, "plugins.lualine")
  if not success then
    print("Error loading Lualine:", plugin)
  end

  -- If all successful, load them with lazy.nvim
  require("lazy").setup({
    require("plugins.noice"),
    require("plugins.nvimtree"),
    require("plugins.lualine"),
  })
end

-- Initialize plugins
load_plugins()

-- Key bindings
vim.api.nvim_set_keymap('n', '\\f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
