-- nvim-cmp stuff
local cmp = require'cmp'

cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- LSP stuff
local nvim_lsp = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('sqls').on_attach(client, bufnr)
end

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities=capabilities
}
nvim_lsp.rnix.setup{}

nvim_lsp.sqls.setup {
  on_attach=on_attach,
  capabilities=capabilities,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5435 user=etl password=password dbname=bi sslmode=disable',
        },
      },
    },
  },
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  capabilities=capabilities,
  filetypes = {
    'css',
    'json',
    'markdown',
    'python',
    'scss',
    'sh',
    'sql',
  },
  init_options = {
    linters = {
      -- shellcheck = {
      --   sourceName = 'shellcheck',
      --   command = 'shellcheck',
      --   debounce = 100,
      --   args = { '--format', 'json1', '-' },
      --   parseJson = {
      --     errorsRoot = 'comments',
      --     sourceName = 'file',
      --     line = 'line',
      --     column = 'column',
      --     endLine = 'endLine',
      --     endColumn = 'endColumn',
      --     security = 'level',
      --     message = '[shellcheck] ${message} [SC${code}]',
      --   },
      --   securities = {
      --     error = 'error',
      --     warning = 'warning',
      --     info = 'info',
      --     style = 'hint',
      --   },
      -- },
      flake8 = {
        command = 'flake8',
        sourceName = 'flake8',
        args = { '--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s', '-' },
        debounce = 100,
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
          [[(\d+),(\d+),([A-Z]),(.*)(\r|\n)*$]],
          { line = 1, column = 2, security = 3, message = { '[flake8] ', 4 } },
        },
        securities = {
          W = 'warning',
          E = 'error',
          F = 'error',
          C = 'error',
          N = 'error',
        }
      },
    },
    filetypes = {
      sh = 'shellcheck',
      python = 'flake8',
    },
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin', '--stdin-filepath', '%filename' }
      },
      pgformatter = {
        command = 'pg_format',
        args = {'--nogrouping', '--spaces', '2',  '--type-case', '1',  '--keyword-case', '1', '-' }
      },
      black = {
        command = 'black',
        args = { '--quiet', '-' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      scss = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
      sql = 'pgformatter',
      python = 'black',
    }
  }
}


-- Treesitter stuff
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "bash",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "json",
      "lua",
      "nix",
      "python",
      "regex",
      "ruby",
      "vim",
      "yaml",
    },
  sync_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}
