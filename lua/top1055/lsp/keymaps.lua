local M = {}

local function keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "[e", function() vim.diagnostuic.goto_prev({severity = vim.diagnostic.severity.ERROR}) end)
  vim.keymap.set("n", "]e", function() vim.diagnostuic.goto_next({severity = vim.diagnostic.severity.ERROR}) end)

  -- Goto
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gs", vim.lsp.buf.implementation)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)

  if client.resolved_capabilities.document_formatting then
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.formatting)
  end

  --[[ TODO
  -- Whichkey
  local keymap_l = {
    l = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    },
  }
  ]]

end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
