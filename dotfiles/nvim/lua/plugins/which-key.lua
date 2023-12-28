return {

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
        ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
        ["<leader>C"] = { name = "+ChatGPT" },

        ["<leader>Cc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        ["<leader>Ce"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
        ["<leader>Cg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },

        ["<leader>Ct"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
        ["<leader>Ck"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
        ["<leader>Cd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
        ["<leader>Ca"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
        ["<leader>CR"] = { "<cmd>ChatGPTCompleteCode <CR>", "Complete Code" },

        ["<leader>Co"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
        ["<leader>Cs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize Text" },
        ["<leader>Cf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
        ["<leader>Cx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
        ["<leader>Cr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
        ["<leader>Cl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
