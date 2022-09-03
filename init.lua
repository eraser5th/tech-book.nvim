local check_neovim_version = function()
  if vim.fn.has("nvim-0.7") ~= 1 then
    vim.notify("Please upgrade your Neovim to v0.7+.", vim.log.levels.WARN)
    vim.wait(5000, function()
      return false
    end)
    vim.cmd("cquit")
  end
end

local init = function()
  check_neovim_version()

  require("core.bootstrap").setup()
  require("core.keymaps").setup()
  require("core.options").setup()
  require("core.plugin").setup()
end

init()
