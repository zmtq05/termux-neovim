require("nvim-lsp-installer").setup {
  ensure_installed = {},
  automatic_installation = false,
}
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local DEFAULT_SETTINGS = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
      nvim.augroup("LspDocumentHighlight") {
        {
          "CursorHold",
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
        },
        {
          { "CursorMoved", "InsertEnter" },
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
        },
      }
    end
    local function set(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end
    local function n(...)
      return set("n", ...)
    end

    local function lua(cmd)
      return "<Cmd>lua " .. cmd .. "<CR>"
    end
    --set("n", "K", lua("vim.lsp.buf.hover()"))
    n("K", lua("vim.lsp.buf.hover()"))
    set("n", "<leader>r", lua("vim.lsp.buf.rename()"))
    set("n", "<leader>a", lua("vim.lsp.buf.code_action()"))
    set("n", "<leader>f", lua("vim.lsp.buf.format()"))
    set("n", "<leader>D", lua("vim.lsp.buf.type_definition()"))
    set("n", "gr", lua("vim.lsp.buf.references()"))
    set("n", "gD", lua("_G.peek_definition()"))
    set("n", "gd", lua("vim.lsp.buf.definition()"))
    set("n", "gi", lua("vim.lsp.buf.implementation()"))

    set("n", "]d", lua("vim.diagnostic.goto_next()"))
    set("n", "[d", lua("vim.diagnostic.goto_prev()"))
    local err = "{ severity = vim.diagnostic.severity.ERROR }"
    set("n", "]e", lua("vim.diagnostic.goto_next" .. err))
    set("n", "[e", lua("vim.diagnostic.goto_prev" .. err))
  end,
}

setmetatable(DEFAULT_SETTINGS, {
  __call = function(self, ...)
    return vim.tbl_deep_extend("force", self, ...)
  end,
})
local lsp = require("lspconfig")
lsp.sumneko_lua.setup(require("lua-dev").setup {
  lspconfig = DEFAULT_SETTINGS {
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.cwd()
    end,
  },
})
lsp.pylsp.setup(DEFAULT_SETTINGS)
