return {
	{
		-- Fancy Dashboard
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local dashboard = require("dashboard")

			-- Function to choose between "Create New File" and "Find File"
			local function file_options()
				vim.ui.select({ "📄 Create New File", "🔍 Find File" }, {
					prompt = "Choose an option:",
				}, function(choice)
					if choice == "📄 Create New File" then
						vim.cmd("ene | startinsert")
					elseif choice == "🔍 Find File" then
						require("telescope.builtin").find_files()
					end
				end)
			end

			dashboard.setup({
				theme = "hyper",
				config = {
					week_header = { enable = true },
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = file_options, -- Calls the function to show options
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = function()
								require("telescope.builtin").commands()
							end,
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = function()
								require("telescope.builtin").find_files({
									cwd = vim.fn.expand("~/.config/nvim"),
									hidden = true,
									follow = true,
								})
							end,
							key = "d",
						},
					},
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "🔍 ",
					selection_caret = "➜ ",
					path_display = { "truncate" },
					file_ignore_patterns = { "node_modules", ".git", "dist" },
				},
				pickers = {
					find_files = { hidden = true },
					live_grep = { only_sort_text = true },
				},
			})
		end,
	},
}
