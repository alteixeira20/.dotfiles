return {
	-- Fidget (LSP Progress)
	{
		"j-hui/fidget.nvim",
		lazy = false, -- Force load on startup
		event = "VeryLazy", -- Load once UI is ready
		config = function()
			require("fidget").setup({
				progress = {
					poll_rate = 50, -- Check for progress updates every 50ms
					suppress_on_insert = true, -- Hide messages while typing
				},
				notification = {
					poll_rate = 10, -- Update notifications every 10ms
					filter = vim.log.levels.WARN, -- Show warnings & errors only
					override_vim_notify = false, -- Let `nvim-notify` handle notifications
				},
				integration = {
					["nvim-tree"] = { enable = true }, -- Enable nvim-tree integration
				},
			})
		end,
	},
	{
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "static", -- Removes animations for instant popups
			timeout = 3500, -- Notifications disappear faster (2.5 seconds)
			fps = 120, -- Increases refresh rate for smoother display
			background_colour = "#282c34", -- Dark grey background
			render = "wrapped-default", -- Standard text rendering
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
			max_width = 50,

			-- Dynamically position notifications in the top-right corner

			on_open = function(win)
				local opts = {
					relative = "editor",
					anchor = "NE",
					row = 2,
					col = vim.o.columns - 5, -- Prevents clipping
				}
				vim.api.nvim_win_set_config(win, opts)
			end,
		})

		-- Use `nvim-notify` as the default notification handler
		vim.notify = notify
	end,
	},
}
