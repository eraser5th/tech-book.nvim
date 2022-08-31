local M = {}

local regist_whichkey = function()
  if not require("util").check_module_availability("which-key") then
    return
  end

  local mappings = {
    h = {
      name = "Hop",
      w = { ":HopWord<CR>", "Hop Word" },
      l = { ":HopLine<CR>", "Hop Line" },
      p = { ":HopPattern<CR>", "Hop Pattern" },
    },
  }

  local opts = { prefix = "<Leader>" }

  require("which-key").register(mappings, opts)
end

M.setup = function()
  require("hop").setup({
    keys = "etovxqpdygfblhckisuran",
    quit_key = "<Esc>",
    jump_on_sole_occurrence = false,
    uppercase_labels = true,
  })

  regist_whichkey()
end

return M
