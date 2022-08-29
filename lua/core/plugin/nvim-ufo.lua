local M = {}

M.setup = function()
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1'

  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local targetWidth = width - vim.fn.strdisplaywidth(suffix)
    local curWidth = 0

    for _, chunk in ipairs(virtText) do
      local chunkText =  chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. ('a'):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end

    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
  end

  require('ufo').setup({
    -- close_fold_kind = "comment", -- 'comment' | 'imports' | 'region'
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  })

  -- buffer scope handler
  -- will override global handler if it is existed
  local bufnr = vim.api.nvim_get_current_buf()
  require('ufo').setFoldVirtTextHandler(bufnr, handler)

end

return M
