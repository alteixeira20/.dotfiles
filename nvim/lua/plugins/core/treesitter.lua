return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',  -- Automatically update parsers
	config = function()
	require'nvim-treesitter.configs'.setup {
		-- Add languages you want to install; use "all" to install all supported languages
		--ensure_installed = { "lua", "python", "javascript", "html", "css", "c" }, 
		sync_install = true,  -- Set to true if you want synchronous installation
		auto_install = true,   -- Automatically install missing parsers when opening a file
		highlight = {
	        	enable = true,       -- Enable syntax highlighting
	        	additional_vim_regex_highlighting = false,  -- Disable Vim regex highlighting for performance
		},
		indent = { enable = true },  -- Enable treesitter-based indentation
	}
 	end,
}
