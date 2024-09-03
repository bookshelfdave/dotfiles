-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  -- Enable `ae` to target entire buffer (ex. =ae for format the entire buffer)
  { "kana/vim-textobj-user",  priority = 1001 },
  { "kana/vim-textobj-entire" },


  -- hit enter in normal mode to zoom a buffer
  {
    'nyngwang/NeoZoom.lua',
    config = function()
      require('neo-zoom').setup {
        popup = { enabled = true }, -- this is the default.
        -- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
        -- EXPLAIN: This improves the performance, and you won't see two
        --          identical buffers got updated at the same time.
        -- popup = {
        --   enabled = true,
        --   exclude_filetypes = {},
        --   exclude_buftypes = {},
        -- },
        exclude_buftypes = { 'terminal' },
        -- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
        winopts = {
          offset = {
            -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
            --top = 0,
            --left = 0.17,
            width = 1,
            height = 1,
          },
          -- NOTE: check :help nvim_open_win() for possible border values.
          border = 'thicc', -- this is a preset, try it :)
        },
        presets = {
          {
            -- NOTE: regex pattern can be used here!
            filetypes = { 'dapui_.*', 'dap-repl' },
            winopts = {
              offset = { top = 0.02, left = 0.02, width = 0.74, height = 0.25 },
            },
          },
          {
            filetypes = { 'markdown' },
            callbacks = {
              function() vim.wo.wrap = true end,
            },
          },
        },
      }
      vim.keymap.set('n', '<CR>', function()
        vim.cmd('NeoZoomToggle')
      end, { silent = true, nowait = true })
    end
  },


  { "phanviet/vim-monokai-pro" },

  {
    "cpea2506/one_monokai.nvim",
    config = function()
      require('one_monokai').setup {
      }
    end
  },


  -- see keybindings below
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        --
        -- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
        -- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
        -- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
        -- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
        -- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
        -- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
      }
    end
  },


  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },

  -- space lq :-)
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  }, --

  { 'nvim-telescope/telescope-ui-select.nvim' },

  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {}
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
      })
    end
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },

  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require('neoscroll').setup({})
  --   end
  -- },

  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    },
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopLineStart<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },

  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },

  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },


  {
    "HampusHauffman/block.nvim",
    config = function()
      require("block").setup({})
    end
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },

}

-- enable treesitter integration
lvim.builtin.treesitter.matchup.enable = true

-- start telescope-ui-select
require("telescope").load_extension("ui-select")

lvim.builtin.which_key.mappings["o"] = {
  name = "Hopping",
  s = { '<cmd>HopLineStart<cr>', "Hop line start" },
  S = { '<cmd>HopWord<cr>', "Hop word" },
  l = { '<cmd>HopLine<cr>', "Hop line" },
  p = { '<cmd>HopPattern<cr>', "Hop pattern" },


}

-- Spectre stuff
lvim.keys.normal_mode["<leader>S"] = '<cmd>lua require("spectre").toggle()<CR>'
lvim.keys.normal_mode["<leader>Sw"] = '<cmd>lua require("spectre").open_visual({select_word=true})<CR>'
lvim.keys.visual_mode["<leader>Sw"] = '<esc><cmd>lua require("spectre").open_visual()<CR>'
lvim.keys.normal_mode["<leader>Sp"] = '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>'


lvim.builtin.which_key.mappings["S"] = {
  name = "Spectre",
  s = { '<cmd>lua require("spectre").toggle()<CR>', "Spectre" },
  w = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Open Visual" },
  p = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Select word" },
}

-- Ranger stuff
lvim.keys.normal_mode["<leader>R"] = '<cmd>RnvimrToggle<CR>'

-- Persistence stuff
lvim.builtin.which_key.mappings["P"] = {
  name = "Projects",
  s = { '<cmd>lua require("persistence").load()<cr>', "Restore session from CWD" },
  l = { '<cmd>lua require("persistence").load({ last = true })<cr>', "Restore last session" },
  d = { '<cmd>lua require("persistence").stop()<cr>', "Don't save session" },
}


lvim.builtin.which_key.mappings["t"] = {
  name = "Toggle",
  n = { '<cmd>set number!<cr>', "Line Numbers" },
  r = { '<cmd>set invrelativenumber<cr>', "Relative Line Numbers" },
  b = { '<cmd>Block<cr>', "Blocks" },
  l = { '<cmd>IndentBlanklineToggle<cr>', "Indent lines" },
}


lvim.builtin.which_key.mappings["ly"] = {
  "<cmd>SymbolsOutline<cr>", "Symbol outline"
}


lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"


--lvim.builtin.lualine.sections.lualine_b = { "lsp_progress" }
lvim.builtin.autopairs.active = false
lvim.builtin.lualine.options.theme = "iceberg_dark"
lvim.colorscheme = "catppuccin-mocha"

lvim.format_on_save.enabled = true

vim.opt.timeoutlen = 250 -- or 500 (Default: 1000)

-- toggle with space t n
vim.opt.number = false

-- Roboto Mono Nerd Font uses a dumb looking separator
-- https://github.com/folke/which-key.nvim
lvim.builtin.which_key.setup.icons.separator = '»'
lvim.builtin.which_key.setup.icons.group = ":"

lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.indentlines.options.enabled = false

lvim.builtin.which_key.mappings["W"] = {
  "<cmd>noautocmd w<CR>", "Force save"
}
