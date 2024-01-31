-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  -- Random
  "andrewradev/linediff.vim",
  "christoomey/vim-tmux-navigator",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "justinmk/vim-sneak",
  -- "lambdalisue/nerdfont.vim",
  -- "lambdalisue/fern-renderer-nerdfont.vim",
  -- "lambdalisue/fern.vim",

  -- TS/LS stuff
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      -- { "hrsh7th/cmp-vsnip" },
      -- { "hrsh7th/vim-vsnip" }
      { "saadparwaiz1/cmp_luasnip"},
      { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local conf = {
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "vsnip" },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
          -- expand = function(args)
          --   -- Comes from vsnip
          --   fn["vsnip#anonymous"](args.body)
          -- end,
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
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- I use tabs... some say you should stick to ins-completion but this is just here as an example
          -- ["<Tab>"] = function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   else
          --     fallback()
          --   end
          -- end,
          -- ["<S-Tab>"] = function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   else
          --     fallback()
          --   end
          -- end,
        }),
      }
      return conf
    end
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "mfussenegger/nvim-dap",
        config = function(self, opts)
          -- Debug settings if you're using nvim-dap
          local dap = require("dap")

          dap.configurations.scala = {
            {
              type = "scala",
              request = "launch",
              name = "RunOrTest",
              metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
              },
            },
            {
              type = "scala",
              request = "launch",
              name = "Test Target",
              metals = {
                runType = "testTarget",
              },
            },
          }
        end
      },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      -- Example of settings
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }

      -- *READ THIS*
      -- I *highly* recommend setting statusBarProvider to true, however if you do,
      -- you *have* to have a setting to display this in your statusline or else
      -- you'll not see any messages from metals. There is more info in the help
      -- docs about this
      -- metals_config.init_options.statusBarProvider = "on"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()

        -- LSP mappings
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        -- map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>k", vim.lsp.buf.signature_help)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>f", vim.lsp.buf.format)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        -- map("n", "<leader>ws", function()
        --   require("metals").hover_worksheet()
        -- end)

        -- all workspace diagnostics
        map("n", "<leader>aa", vim.diagnostic.setqflist)

        -- all workspace errors
        map("n", "<leader>ae", function()
          vim.diagnostic.setqflist({ severity = "E" })
        end)

        -- all workspace warnings
        map("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = "W" })
        end)

        -- buffer diagnostics only
        map("n", "<leader>d", vim.diagnostic.setloclist)

        map("n", "[c", function()
          vim.diagnostic.goto_prev({ wrap = false })
        end)

        map("n", "]c", function()
          vim.diagnostic.goto_next({ wrap = false })
        end)

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        -- map("n", "<leader>dc", function()
        --   require("dap").continue()
        -- end)

        -- map("n", "<leader>dr", function()
        --   require("dap").repl.toggle()
        -- end)

        -- map("n", "<leader>dK", function()
        --   require("dap.ui.widgets").hover()
        -- end)

        -- map("n", "<leader>dt", function()
        --   require("dap").toggle_breakpoint()
        -- end)

        -- map("n", "<leader>dso", function()
        --   require("dap").step_over()
        -- end)

        -- map("n", "<leader>dsi", function()
        --   require("dap").step_into()
        -- end)

        -- map("n", "<leader>dl", function()
        --   require("dap").run_last()
        -- end)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "neovim/nvim-lspconfig",
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  
  -- Visual
  -- "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"
  "lewis6991/gitsigns.nvim",
  "reedes/vim-colors-pencil",                    -- Color scheme
  "reedes/vim-thematic",                         -- Allows fast toggle between dark and light theme
  "vim-airline/vim-airline",                     -- Simple feature rich statusbar
  "vim-airline/vim-airline-themes",
  
  -- Writing
  "junegunn/goyo.vim",                           -- Distraction free writing mode
  "reedes/vim-pencil",                           -- Markdown tools
  
  -- All hail tpope
  "tpope/vim-commentary",
  "tpope/vim-dispatch",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",                           -- GitHub
  "tpope/vim-sensible",
  "tpope/vim-speeddating",                       -- <C-A> <C-X> for dates
  "tpope/vim-surround",
  "tpope/vim-unimpaired",                        -- [] mappings
  "tpope/vim-vinegar"                           -- Enhance netrw
})

require('gitsigns').setup()
