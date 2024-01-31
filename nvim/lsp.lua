-- https://medium.com/@rishavinmngo/how-to-setup-lsp-in-neovim-1c3e5073bbd1
-- Setup language servers.
local lspconfig = require('lspconfig')

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local luasnip = require 'luasnip'

local servers = {
    "lua_ls",
    "tsserver"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        {name = "buffer"},
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }),
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
  -- This is where we attach the autoformatting for reasonable clients
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    local bufnr = args.buf

    if not client.server_capabilities.documentFormattingProvider then
      return
    end
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   group = get_augroup(client),
    --   buffer = bufnr,
    --   callback = function()
    --     if not format_is_enabled then
    --       return
    --     end
    --     vim.lsp.buf.format {
    --       async = false,
    --       filter = function(c)
    --         return c.id == client.id
    --       end,
    --     }
    --   end,
    -- })
  end,
})


lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rnix.setup{}
-- lspconfig.metals.setup{}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)                    -- go to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)                     -- go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                           -- hover
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)                 -- go to implementation
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)              -- signature help
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)    -- 
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>d', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
