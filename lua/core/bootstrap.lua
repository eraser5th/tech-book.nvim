local util = require("util")

local M = {}

local delete_packer = function(packer_path)
  vim.fn.delete(packer_path, "rf")
end

local install_packer = function(packer_path)
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  vim.cmd("packadd packer.nvim")
end

M.setup = function()
  local packer_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"

  if not util.check_module_availability("packer") then
    delete_packer(packer_path)
    install_packer(packer_path)
  end

  if not util.check_module_availability("packer") then
    vim.api.nvim_err_writeln("Failed to load packer at: " .. packer_path)
    return
  end
end

return M
