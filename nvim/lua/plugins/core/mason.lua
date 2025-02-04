return {
	{
		"williamboman/mason.nvim",
		lazy = false, -- Load immediately
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" }, -- Automatically install lua-language-server
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua LSP
			lspconfig.lua_ls.setup({
				on_attach = function(client, bufnr)
					-- Keymaps for LSP
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
