local M = {}

local setup_options = function()
  return {
    mappings = {},
  }
end

local issue_mappings = function()
  return {
    name = "+issue",
    l = {
      function()
        require("octo.commands").commands.issue.list()
      end,
      "List all issues",
    },
    c = {
      function()
        require("octo.commands").commands.issue.close()
      end,
      "Close current issue",
    },
    o = {
      function()
        require("octo.commands").commands.issue.reopen()
      end,
      "Reopen the current issue",
    },
    b = {
      function()
        require("octo.commands").commands.issue.browser()
      end,
      "Open current issue in the browser",
    },
    n = {
      function()
        require("octo.commands").commands.issue.create()
      end,
      "Creates a new issue in the current repo",
    },
    d = {
      function()
        require("octo.picker").commands.changed_files()
      end,
      "List changed files",
    },
  }
end

local pr_mappings = function()
  local commands = require("octo.commands").commands

  return {
    name = "+pull request",
    l = {
      function()
        commands.pr.list()
      end,
      "List all PRs satisfying given filter",
    },
    o = {
      function()
        commands.pr.reopen()
      end,
      "Reopen the current PR",
    },
    c = {
      function()
        commands.pr.close()
      end,
      "Close the current PR",
    },
    n = {
      function()
        commands.pr.create()
      end,
      "Create a new PR for the current branch",
    },
    h = {
      function()
        commands.pr.commits()
      end,
      "List all PR commits",
    },
    d = {
      function()
        commands.pr.diff()
      end,
      "Show PR diff",
    },
    b = {
      function()
        commands.pr.browser()
      end,
      "Open current PR in the browser",
    },
  }
end

local reaction_mappings = function()
  local commands = require("octo.commands").commands

  return {
    name = "+reaction",
    ["+"] = {
      function()
        commands.reaction.thumbs_up()
      end,
      "Reaction 👍",
    },
    ["-"] = {
      function()
        commands.reaction.thumbs_down()
      end,
      "Reaction 👎",
    },
    e = {
      function()
        commands.reaction.eyes()
      end,
      "Reaction 👀",
    },
    l = {
      function()
        commands.reaction.laugh()
      end,
      "Reaction 😄",
    },
    c = {
      function()
        commands.reaction.confused()
      end,
      "Reaction 😕",
    },
    t = {
      function()
        commands.reaction.tada()
      end,
      "Reaction 🎉",
    },
    r = {
      function()
        commands.reaction.rocket()
      end,
      "Reaction 🚀",
    },
  }
end

local review_mappings = function()
  local commands = require("octo.commands").commands
  return {
    name = "+review",
    n = {
      function()
        commands.review.start()
      end,
      "Start review",
    },
    r = {
      function()
        commands.review.resume()
      end,
      "Resume",
    },
    c = {
      function()
        commands.review.comments()
      end,
      "Show comments",
    },
    s = {
      function()
        commands.review.submit()
      end,
      "Submit",
    },
    d = {
      function()
        commands.review.discard()
      end,
      "Discard",
    },
    C = {
      function()
        commands.review.close()
      end,
      "Close review",
    },
  }
end

local register_whichkey = function()
  local which_key = require("which-key")
  local commands = require("octo.commands").commands

  local opts = { prefix = "<Leader>" }
  local mappings = {
    o = {
      name = "+Octo(GitHub Client)",
      a = {
        function()
          commands.actions()
        end,
        "List all actions",
      },
      i = issue_mappings(),
      p = pr_mappings(),
      ["<C-r>"] = reaction_mappings(),
      r = review_mappings(),
      c = {
        name = "+comment",
        a = {
          function()
            commands.comment.add()
          end,
          "Add comment",
        },
        d = {
          function()
            commands.comment.delete()
          end,
          "Delete comment",
        },
      },
      A = {
        name = "+assignee",
        a = {
          function()
            commands.assignee.add()
          end,
          "Add assignee",
        },
        r = {
          function()
            commands.assignee.remove()
          end,
          "Remove assignee",
        },
      },
      R = {
        name = "+reviewer",
        a = {
          function()
            commands.reviewer.add()
          end,
          "Add reviewer",
        },
        r = {
          function()
            commands.reviewer.remove()
          end,
          "Remove reviewer",
        },
      },
      L = {
        name = "+label",
        n = {
          function()
            commands.label.create()
          end,
          "Create label",
        },
        a = {
          function()
            commands.label.add()
          end,
          "Add label",
        },
        r = {
          function()
            commands.label.remove()
          end,
          "Remove label",
        },
      },
    },
  }

  which_key.register(mappings, opts)
end

M.setup = function()
  require("octo").setup(setup_options())
  register_whichkey()
end

return M
