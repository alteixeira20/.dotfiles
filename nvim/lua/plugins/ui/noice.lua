return {
	-- Noice.nvim (Enhanced command line, messages, and notifications)
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim", -- UI improvements
			"rcarriga/nvim-notify", -- Notification popups
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				views = {
					cmdline_popup = {
						position = { row = "40%", col = "50%" },
						size = { width = 60, height = "auto" },
						border = { style = "rounded" },
						win_options = { winblend = 20 }, -- Transparency
					},
				},
				routes = {
					-- Highlight keywords in messages
					{
						view = "notify",
						filter = { event = "msg_show", find = "ERROR" },
						opts = { highlight = "ErrorMsg" },
					},
					{
						view = "notify",
						filter = { event = "msg_show", find = "SUCCESS" },
						opts = { highlight = "MoreMsg" },
					},
					{
						filter = { event = "msg_showmode" }, -- Disable "INSERT" notifications
						opts = { skip = true
					},
                },
				},
			})
		end,
	},

	-- Highlight important words in messages
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.25, -- Transparency effect
					color = { "Normal", "#ffffff" },
				},
				context = 10, -- Keep 10 lines of context highlighted
			})
		end,
	},
}
