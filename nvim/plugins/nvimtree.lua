return {
  "nvim-tree/nvim-tree.lua",
  requires = {
    "nvim-tree/nvim-web-devicons", -- Icons for file explorer
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
