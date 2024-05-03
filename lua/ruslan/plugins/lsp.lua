local lsp_zero = require('lsp-zero')

local cmp = require('cmp')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr, preserve_mappings = false})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'lua_ls',
    'jsonls',
    'hydra_lsp' 

  },
  handlers = {
    lsp_zero.default_setup,
  },
})

cmp.setup({
--  sources = {
--    {name = 'nvim_lsp'},
--  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
 },
 -- snippet = {
 --   expand = function(args)
 --     require('luasnip').lsp_expand(args.body)
 --   end,
 -- },
})


