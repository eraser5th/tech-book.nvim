local M = {}

local setup_options = function()
  return {
    disable_default_keybindings = 0,
    bindings = {
      ["q"] = function()
        require("sidebar-nvim").close()
      end,
    },
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "datetime", "git", "diagnostics" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    containers = {
      attach_shell = "/bin/sh",
      show_all = true,
      interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
  }
end

M.setup = function()
  local sidebar = require("sidebar-nvim")
  sidebar.setup(setup_options())
end

return M
