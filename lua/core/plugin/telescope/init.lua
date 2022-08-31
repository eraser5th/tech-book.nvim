local M = {}

M.setup = function()
  vim.cmd([[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  ]])

  vim.keymap.set("n", "<C-p>", ":Telescope command_palette<CR>")

  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key",
        },
      },
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },

    -- 本来は
    -- extensions = require("core.plugin.telescope.extensions")
    -- としたいのだが、telescope-command-paletteの設定がうまく行かなくなるそうなので、このようにしています。
    extensions = {
      emoji = require("core.plugin.telescope.extensions.telescope-emoji"),
      command_palette = {
        {
          "File",
          { "entire selection (C-a)", ':call feedkeys("GVgg")' },
          { "save current file (C-s)", ":w" },
          { "save all files (C-A-s)", ":wa" },
          { "quit (C-q)", ":qa" },
          {
            "file browser (C-i)",
            ":lua require'telescope'.extensions.file_browser.file_browser()",
            1,
          },
          {
            "search word (A-w)",
            ":lua require('telescope.builtin').live_grep()",
            1,
          },
          {
            "git files (A-f)",
            ":lua require('telescope.builtin').git_files()",
            1,
          },
          {
            "files (C-f)",
            ":lua require('telescope.builtin').find_files()",
            1,
          },
        },
        {
          "Help",
          { "tips", ":help tips" },
          { "cheatsheet", ":help index" },
          { "tutorial", ":help tutor" },
          { "summary", ":help summary" },
          { "quick reference", ":help quickref" },
          {
            "search help(F1)",
            ":lua require('telescope.builtin').help_tags()",
            1,
          },
        },
        {
          "Vim",
          { "reload vimrc", ":source $MYVIMRC" },
          { "check health", ":checkhealth" },
          { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
          { "commands", ":lua require('telescope.builtin').commands()" },
          {
            "command history",
            ":lua require('telescope.builtin').command_history()",
          },
          {
            "registers (A-e)",
            ":lua require('telescope.builtin').registers()",
          },
          {
            "colorshceme",
            ":lua require('telescope.builtin').colorscheme()",
            1,
          },
          { "vim options", ":lua require('telescope.builtin').vim_options()" },
          { "keymaps", ":lua require('telescope.builtin').keymaps()" },
          { "buffers", ":Telescope buffers" },
          {
            "search history (C-h)",
            ":lua require('telescope.builtin').search_history()",
          },
          { "paste mode", ":set paste!" },
          { "cursor line", ":set cursorline!" },
          { "cursor column", ":set cursorcolumn!" },
          { "spell checker", ":set spell!" },
          { "relative number", ":set relativenumber!" },
          { "search highlighting (F12)", ":set hlsearch!" },
          { "Split window vertical", "<C-w>v" },
          { "Split window holizontal", "<C-w>h" },
        },
        {
          "GitHub",
          -- issue
          { "List all issues", ":Octo issue list" },
          { "Close the current issue", ":Octo issue close" },
          { "Reopen the current issue", ":Octo issue reopen" },
          { "Open current issue in the browser", ":Octo issue browser" },
          { "Creates a new issue in the current repo", ":Octo issue create" },
          {
            "List changed files",
            ":lua require('octo.picker').changed_files()",
          },
          -- pr
          { "List all PRs satisfying given filter", ":Octo pr list" },
          { "Reopen the current PR", ":Octo pr reopen" },
          { "Close the current PR", ":Octo pr close" },
          { "Creates a new PR for the current branch", ":Octo pr create" },
          { "List all PR commits", ":Octo pr commits" },
          { "Show PR diff", ":Octo pr diff" },
          { "Merge PR", ":Octo pr merge commit" },
          { "Squash and merge PR", ":Octo pr merge squash" },
          {
            "Add reviewer",
            ":lua require('octo.commands').add_user('reviewer')",
          },
          {
            "Remove reviewer",
            ":lua require('octo.commands').remove_user('reviewer')",
          },
          {
            "Add assignee",
            ":lua require('octo.commands').add_user('assignee')",
          },
          {
            "Remove assignee",
            ":lua require('octo.commands').remove_user('assignee')",
          },
          { "Open current PR in the browser", ":Octo pr browser" },
          { "Create label", ":lua require('octo.commands').create_label()" },
          { "Add label", ":lua require('octo.commands').add_label()" },
          { "Remove label", ":lua require('octo.commands').remove_label()" },
          -- repo
          {
            "List repos user owns, contributes or belong to",
            ":Octo repo list",
          },
          { "Open current repo in the browser", ":Octo repo browser" },
          -- comment
          { "Add a new comment", ":Octo comment add" },
          { "Delete a comment", ":Octo comment delete" },
          -- thread
          { "Mark a review thread as resolved", ":Octo thread resolve" },
          { "Mark a review thread as unresolved", ":Octo thread unresolve" },
        },
      },
    },
  })

  require("telescope").load_extension("command_palette")
end

return M
