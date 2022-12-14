require("nvim-lsp-installer").setup({
  ensure_installed = {
    "cssls", "eslint", "intelephense", "jsonls", "tailwindcss", "tsserver",
    "vuels", "yamlls", "sumneko_lua", "html", "jdtls", "astro", "pyright",
  }
})

-- LSP config
-- https://github.com/neovim/nvim-lspconfig
-- See also :help lspconfig.

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local map = vim.keymap.set
  map("n", "<localleader>D", ":lua vim.lsp.buf.declaration()<CR>")
  map("n", "<localleader>d", ":lua vim.lsp.buf.definition()<CR>")
  map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
  map("n", "<localleader>i", ":lua vim.lsp.buf.implementation()<CR>")
  map("n", "<localleader>k", ":lua vim.lsp.buf.signature_help()<CR>")
  map("n", "<localleader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>")
  map("n", "<localleader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
  map("n", "<localleader>wl",
    ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  map("n", "<localleader>D", ":lua vim.lsp.buf.type_definition()<CR>")
  map("n", "<localleader>r", ":lua vim.lsp.buf.rename()<CR>")
  map("n", "<localleader>a", ":lua vim.lsp.buf.code_action()<CR>")
  map("n", "<localleader>n", ":lua vim.lsp.buf.references()<CR>")
  map("n", "<localleader>o", ":lua vim.diagnostic.open_float()<CR>")
  map("n", "<localleader>E", ":lua vim.diagnostic.goto_prev()<CR>")
  map("n", "<localleader>e", ":lua vim.diagnostic.goto_next()<CR>")
  map("n", "<localleader>c", ":lua vim.diagnostic.setloclist()<CR>")
  map("n", "<localleader>f", ":lua vim.lsp.buf.formatting()<CR>")
end

local lsp = require("lspconfig")
lsp.cssls.setup({ on_attach = on_attach })
lsp.eslint.setup({ on_attach = on_attach })
lsp.html.setup({ on_attach = on_attach })
lsp.intelephense.setup({ on_attach = on_attach })
lsp.jsonls.setup({ on_attach = on_attach })
lsp.tailwindcss.setup({ on_attach = on_attach })
lsp.tsserver.setup({ on_attach = on_attach })
lsp.vimls.setup({ on_attach = on_attach })
lsp.vuels.setup({ on_attach = on_attach })
lsp.yamlls.setup({ on_attach = on_attach })
lsp.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } -- Get the language server to recognize the `vim` global
      }
    }
  }
})

-- typescript
-- https://github.com/jose-elias-alvarez/typescript.nvim
require("typescript").setup({
  server = { -- pass options to lspconfig's setup method
    on_attach = on_attach
  }
})
lsp.jdtls.setup { cmd = { 'jdtls' } }
