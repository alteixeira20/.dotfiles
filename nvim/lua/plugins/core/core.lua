return {
	-- Lazy.nvim Plugin Manager
	{
		"folke/lazy.nvim",
		priority = 1000,
		config = function()
			require("lazy").setup({
				spec = {
					{ import = "plugins" },
				},
				install = { colorscheme = { "habamax" } },
				checker = { enabled = true },
			})
		end,
	},

	-- Web Dev Icons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
		require("lspconfig").bashls.setup({})
		require("lspconfig").lua_ls.setup({})

		-- Add Clangd for C/C++
		lspconfig.clangd.setup({
			cmd = { "clangd" }, -- Ensure clangd is installed
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			init_options = {
				clangdFileStatus = true,
			},
		})
		end,
	},
}
