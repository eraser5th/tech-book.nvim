local util = require("util")

local M = {}

vim.g.mapleader = " "

local mappings = {
  insert = {
    -- escape insert mode
    ["kj"] = { "<ESC>" },
    ["jj"] = { "<ESC>" },
    ["jk"] = { "<ESC>" },
    ["fd"] = { "<ESC>" },
  },

  normal = {
    -- write and quit
    ["<Leader>w<CR>"] = { ":w<CR>", { desc = "Save file" } },
    ["<Leader>q<CR>"] = { ":q<CR>", { desc = "Quit" } },

    -- window
    ["<Leader>wh"] = { "<C-w>h", { desc = "Go to left window" } },
    ["<Leader>wj"] = { "<C-w>j", { desc = "Go to bottom window" } },
    ["<Leader>wk"] = { "<C-w>k", { desc = "Go to above window" } },
    ["<Leader>wl"] = { "<C-w>l", { desc = "Go to right window" } },
    ["<Leader>wv"] = { "<C-w>v", { desc = "Split window vertically" } },
    ["<Leader>ws"] = { "<C-w>s", { desc = "Split window horizontal" } },

    -- tab
    ["<Leader>tn"] = { ":tabnew<CR>", { desc = "Create new tab" } },
    ["<Leader>th"] = { ":tabnext<CR>", { desc = "Move to next tab" } },
    ["<Leader>tl"] = { ":tabNext<CR>", { desc = "Move to previows tab" } },

    -- terminal
    ["<Leader>'"] = { ":terminal<CR>", { desc = "Open terminal" } },
  },

  terminal = {
    -- escape terminal mode
    ["kj"] = { "<C-\\><C-n>" },
    ["jj"] = { "<C-\\><C-n>" },
    ["jk"] = { "<C-\\><C-n>" },
    ["fd"] = { "<C-\\><C-n>" },
  },

  visual = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },
}

M.setup = function()
  util.set_keymaps("i", mappings.insert)
  util.set_keymaps("n", mappings.normal)
  util.set_keymaps("t", mappings.terminal)
  util.set_keymaps("v", mappings.visual)
end

return M
