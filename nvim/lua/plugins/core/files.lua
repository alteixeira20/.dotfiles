return {
	-- File Explorer (Nvim-Tree)
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		keys = {
			{ "\\f", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
					side = "left",
					number = false,
					relativenumber = false,
				},
				renderer = {
					highlight_git = true,
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								deleted = "",
								untracked = "★",
								ignored = "◌",
							},
						},
					},
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				git = {
					enable = true,
					ignore = false,
				},
			})
		end,
	},
}
