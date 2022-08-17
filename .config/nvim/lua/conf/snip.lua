----------
-- Snip
----------

local map = vim.keymap.set
local cmd = vim.api.nvim_create_user_command

require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./snippets/snipmate" } })
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets/luasnip" } })
cmd("SnipEdit", require("luasnip.loaders").edit_snippet_files, { bang = true })

-- jump on snippet positions
local l = require("luasnip")
map({ "s", "i" }, "<C-j>", function()
  if l.jumpable() then
    l.jump(1)
  end
end)

map({ "s", "i" }, "<C-k>", function()
  if l.jumpable() then
    l.jump(-1)
  end
end)
