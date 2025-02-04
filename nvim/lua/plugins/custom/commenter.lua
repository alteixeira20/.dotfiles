-- -------------------------------------------------------------------------- --
-- Commenter Plugin - Adds a Boxed Comment Around Text                        --
-- -------------------------------------------------------------------------- --

function _G.add_boxed_comment()
    local filetype = vim.bo.filetype or ""
    local comment_start, comment_end, fill_char

    -- Determine comment style
    if filetype == "make" or filetype == "sh" then
        comment_start, comment_end, fill_char = "# ", " #", "*"
    elseif filetype == "c" or filetype == "cpp" or filetype == "h" then
        comment_start, comment_end, fill_char = "/* ", " */", "*"
    elseif filetype == "lua" then
        comment_start, comment_end, fill_char = "-- ", " --", "-"
    else
        comment_start, comment_end, fill_char = "// ", " //", "*"
        vim.notify("File type not configured. Using '//' as default.", vim.log.levels.WARN)
    end

    -- Ask for user input
    vim.ui.input({ prompt = "Enter comment: " }, function(input)
        if not input or input == "" then return end

        local box_width = 80
        local content_width = box_width - #comment_start - #comment_end
        local padding_width = math.floor((content_width - #input) / 2)
        local left_padding, right_padding = padding_width, content_width - #input - padding_width

        local comment_lines = {
            comment_start .. string.rep(fill_char, content_width) .. comment_end,
            comment_start .. string.rep(" ", left_padding) .. input .. string.rep(" ", right_padding) .. comment_end,
            comment_start .. string.rep(fill_char, content_width) .. comment_end,
        }

        -- Insert the comment box into the buffer
        vim.api.nvim_buf_set_lines(0, vim.fn.line(".") - 1, vim.fn.line("."), false, comment_lines)
    end)
end

-- Keybinding to trigger function
vim.keymap.set("n", "<leader>bc", ":lua add_boxed_comment()<CR>", { silent = true, noremap = true })
