-- Load Core Commenter
require("plugins.custom.commenter")

-- Load Lazy.nvim
require("config.lazy")

-- Key bindings
vim.api.nvim_set_keymap('n', '\\h', ':Stdheader<CR>', { noremap = true, silent = true }) -- Put 42header with \h
vim.api.nvim_set_keymap('n', '\\c', ':lua add_boxed_comment()<CR>', { noremap = true, silent = true }) -- Put CommentBox with \c
