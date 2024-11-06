return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    'stevearc/dressing.nvim',
  },
  config = function()
    local rounded_border_style = {
      top_left = "╭",
      top = "─",
      top_right = "╮",
      left = "│",
      right = "│",
      bottom_left = "╰",
      bottom = "─",
      bottom_right = "╯",
    }
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = " 𝝺 ", lang = "vim" },
          search_down = { pattern = "^/", icon = " 🤔 ⮮", lang = "regex", title = " Search " },
          search_up = { pattern = "^%?", icon = " 🤔 ⮭", lang = "regex", title = " Search " },
          filter = { pattern = "^:%s*!", icon = "  ", lang = "bash", title = " Shell " },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = " 🕮  ", title = " Help " },
        },
      },
      lsp = {
        progress = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      views = {
        cmdline_popup = {
          position = { row = "10%", col = "50%" },
          size = { width = "50%", height = "auto" },
          border = { style = rounded_border_style },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    })
  end,
}
