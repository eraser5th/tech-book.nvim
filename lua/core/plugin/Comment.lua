local util = require("util")

local M = {}

M.setup = function()
	require("Comment").setup()
	local api = require("Comment.api")

	local mappings = {
		visual = {
			["<Leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment" } },
		},
		normal = {
			["<Leader>/"] = { "<Plug>(comment_toggle_linewise_current)", { desc = "Comment" } },
		},
	}

	util.set_keymaps("n", mappings.normal)
	util.set_keymaps("v", mappings.visual)
end

return M
