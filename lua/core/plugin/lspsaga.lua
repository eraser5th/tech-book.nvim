local M = {}

local init_options = function ()
  return {
    border_style = "rounded", -- "single" | "double" | "rounded" | "bold" | "plus"
    saga_winblend = 0,
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    show_diagnostic_source = true,
    diagnostic_source_bracket = {},
    max_preview_lines = 15,
    code_action_icon = "💡",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
      enable = true,
      sign = true,
      enable_in_insert = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },
    finder_request_timeout = 1500,
    finder_action_keys = {
      open = "o",
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>",
    },
    code_action_keys = {
      quit = "q",
      exec = "<CR>",
    },
    rename_action_quit = "<Esc>",
    rename_in_select = true,
    definition_preview_icon = "  ",
    show_outline = {
      win_position = 'right',
      win_width = 30,
      auto_enter = true,
      auto_preview = true,
      virt_text = '┃',
      jump_key = 'o',
      auto_refresh = true,
    },
  }
end

M.setup = function()
  require("lspsaga").init_lsp_saga(init_options())

  local actions = {
    goto_prev_error = function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.siagnostic.severity.ERROR })
    end,
    goto_next_error = function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end,
    scroll_doc = function(count)
      return function()
        require("lspsaga.action").smart_scroll_with_saga(count)
      end
    end,
  }

  local opts = { silent = true }
  local mappings = {
    normal = {
      ["K"] = { "<cmd>Lspsaga hover_doc<CR>", opts },
      ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", opts },
      ["gr"] = { "<cmd>Lspsaga rename<CR>", opts },
      ["gd"] = { "<cmd>Lspsaga preview_definition<CR>", opts },
      ["gs"] = { "<Cmd>Lspsaga signature_help<CR>", opts },
      ["[e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", opts },
      ["]e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts },
      ["[E"] = { actions.goto_prev_error, opts },
      ["]E"] = { actions.goto_next_error, opts },
      ["<C-f>"] = { actions.scroll_doc(1), opts },
      ["<C-b>"] = { actions.scroll_doc(-1), opts },
      ["<leader>lo"] = { "<cmd>LSoutlineToggle<CR>", opts },
      ["<Leader>ca"] = { "<cmd>Lspsaga code_action<CR>", opts },
      ["<Leader>cd"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", opts },
    }
  }

  require("util").set_keymaps("n", mappings.normal)

  vim.cmd([[
  augroup lspsaga_filetypes
  autocmd!
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> q <cmd>close!<cr>
  augroup END
  ]])
end

return M
