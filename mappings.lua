local my_utils = require "user.utils"
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Resize window using <A> arrow keys
    ["<S-A-k>"] = { "<cmd>resize +2<CR>", desc = "Increase window height" },
    ["<S-A-j>"] = { "<cmd>resize -2<CR>", desc = "Decrease window height" },
    ["<S-A-l>"] = { "<cmd>vertical resize +2<CR>", desc = "Increase window width" },
    ["<S-A-h>"] = { "<cmd>vertical resize -2<CR>", desc = "Decrease window width" },

    ["<Left>"] = { "<C-w>h", desc = "Go to left window" },
    ["<Right>"] = { "<C-w>l", desc = "Go to right window" },
    ["<Up>"] = { "<C-w>k", desc = "Go to upper window" },
    ["<Down>"] = { "<C-w>j", desc = "Go to lower window" },

    -- 在visual mode 里粘贴不要复制
    -- ["x"] = { '"_x', desc = "Cut without copy" },

    -- better indenting
    ["<"] = { "<<" },
    [">"] = { ">>" },

    -- move
    ["L"] = { "$", desc = "Go to end without blank" },
    ["H"] = { "^", desc = "Go to start without blank" },

    -- buffer
    ["tc"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<C-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- lsp
    ["=="] = {
      function() vim.lsp.buf.format { async = true } end,
      desc = "lsp formatting",
    },
    ["<leader>x"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },

    -- neotree
    ["<leader>`"] = { "<cmd>Neotree<cr>", desc = "Neotree focus" },
    -- terminal
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -- telescope
    ["ff"] = { "<cmd> lua require('telescope.builtin').find_files() <CR>", desc = "live grep" },
    ["F"] = { "<cmd> Telescope live_grep <CR>", desc = "live grep" },
    ["<leader>o"] = {
      function()
        require("telescope.builtin").lsp_document_symbols {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
          "Constant",
          "Variable",
        }
      end,
      desc = "Goto Symbol",
    },
    ["fs"] = {
      function()
        local text = my_utils.getVisualSelection()
        require("telescope.builtin").lsp_dynamic_workspace_symbols {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
          "Constant",
          "Variable",
          default_text = text,
        }
      end,
      desc = "Goto Symbol (Workspace)",
    },
    ["gd"] = {
      "<cmd> Telescope lsp_definitions <CR>",
      desc = "lsp definitions",
    },
    ["gr"] = {
      "<cmd> Telescope lsp_references <CR>",
      desc = "lsp references",
    },
    ["gi"] = {
      "<cmd> Telescope lsp_implementations <CR>",
      desc = "lsp implementations",
    },
    ["<Esc>"] = { ":nohlsearch<CR>", desc = "Close search highlight", silent = true },

    -- ["<leader>x"] = { "<leader>la", expr = true, desc = "Code Action Menu" },
  },
  v = {
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', desc = "Dont copy replaced text", silent = true },

    -- move
    ["L"] = { "$", desc = "Go to end without blank" },
    ["H"] = { "^", desc = "Go to start without blank" },
    ["ff"] = {
      function()
        local tb = require "telescope.builtin"
        local text = my_utils.getVisualSelection()
        tb.find_files { default_text = text }
      end,
      desc = "Goto Symbol (Workspace)",
    },
    ["F"] = {
      function()
        local tb = require "telescope.builtin"
        local text = my_utils.getVisualSelection()
        tb.live_grep { default_text = text }
      end,
      desc = "Goto Symbol (Workspace)",
    },
    ["fs"] = {
      function()
        local text = my_utils.getVisualSelection()
        require("telescope.builtin").lsp_dynamic_workspace_symbols {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
          "Constant",
          "Variable",
          default_text = text,
        }
      end,
      desc = "Goto Symbol (Workspace)",
    },

    -- lsp
    ["=="] = {
      function() vim.lsp.buf.format { async = true } end,
      desc = "lsp formatting",
    },
    ["<leader>x"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
  },
  i = {
    -- save
    ["<C-s>"] = { "<cmd> w! <CR>", desc = "Save file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
}
