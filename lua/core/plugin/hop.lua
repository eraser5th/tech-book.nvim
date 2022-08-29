local M = {}

M.setup = function()
  local hop = require("hop")
  local util = require("util")

  local mappings = {
    ["<Leader>hw"] = { ":HopWord<CR>" },
    ["<Leader>hl"] = { ":HopLine<CR>" },
    ["<Leader>hp"] = { ":HopPattern<CR>" },
  }

  util.set_keymaps({ "n", "v", "x" }, mappings)

  hop.setup({
    keys = 'etovxqpdygfblhckisuran',
    quit_key = '<Esc>',
    jump_on_sole_occurrence = false,
    uppercase_labels = true,
  })
end

return M
