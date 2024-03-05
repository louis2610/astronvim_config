local cmp = require "cmp"
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "smjonas/inc-rename.nvim",
    keys = {
      {
        "R",
        function()
          require "inc_rename"
          return ":IncRename " .. vim.fn.expand "<cword>"
        end,
        expr = true,
        desc = "IncRename",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      opts = function()
        local cmp = require "cmp"
        return {
          {
            type = "/",
            mapping = cmp.mapping.preset.cmdline(),
            completion = { completeopt = "menu,menuone,noselect" },
            sources = {
              { name = "buffer" },
            },
          },
          {
            type = ":",
            mapping = cmp.mapping.preset.cmdline(),
            completion = { completeopt = "menu,menuone,noselect" },
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          },
        }
      end,
      config = function(_, opts)
        local cmp = require "cmp"
        vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
      end,
    },
    opts = {
      completion = {
        -- 自动选中第一条
        completeopt = "menu,menuone,noinsert",
      },
    },
  },
}
