return {
	-- Bufferline (VSCode-style tabs)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					separator_style = "slant", -- Options: "slant", "thick", "thin"
					show_buffer_close_icons = true,
					show_close_icon = false,
					diagnostics = "nvim_lsp", -- Show LSP diagnostics in the tabs
					offsets = {
						{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true }
					},
				},
			})
		end,
	},
}
