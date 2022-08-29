local Table = require("module.Table")
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
    ["<Leader>w<CR>"] = { ":w<CR>" },
    ["<Leader>q<CR>"] = { ":q<CR>" },

    -- window
    ["<Leader>wh"] = { "<C-w>h" }, -- move to left window
    ["<Leader>wj"] = { "<C-w>j" }, -- move to bottom window
    ["<Leader>wk"] = { "<C-w>k" }, -- move to above window
    ["<Leader>wl"] = { "<C-w>l" }, -- move to right window
    ["<Leader>wv"] = { "<C-w>v" }, -- split vertical
    ["<Leader>ws"] = { "<C-w>s" }, -- split horizontal

    -- tab
    ["<Leader>tn"] = { ":tabnew<CR>" }, -- create new tab
    ["<Leader>th"] = { ":echo 'hello'<CR>" }, -- move to next tab
    ["<Leader>tl"] = { ":tabNext<CR>" }, -- move to previows tab

    -- open terminal
    ["<Leader>'"] = { ":terminal<CR>" },
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
