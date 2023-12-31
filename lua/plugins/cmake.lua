local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "cmake" })
      end
    end,
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = opts.sources or {}
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.cmake_lint,
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          neocmake = {},
        },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
    event = "BufRead",
  },
}

return M
