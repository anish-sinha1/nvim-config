local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins

    -- leap
    { import = "lazyvim.plugins.extras.editor.leap" },

    -- prettier
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- eslint
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- mini files
    { import = "lazyvim.plugins.extras.editor.mini-files" },

    -- term
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    -- rust
    { import = "lazyvim.plugins.extras.lang.rust" },

    -- c, c++, cmake
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },

    -- elixir
    { import = "lazyvim.plugins.extras.lang.elixir" },

    -- go
    { import = "lazyvim.plugins.extras.lang.go" },

    -- java
    { import = "lazyvim.plugins.extras.lang.java" },

    -- docker
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- python
    { import = "lazyvim.plugins.extras.lang.python" },

    -- ruby
    { import = "lazyvim.plugins.extras.lang.ruby" },

    -- tailwind
    { import = "lazyvim.plugins.extras.lang.tailwind" },

    -- terraform
    { import = "lazyvim.plugins.extras.lang.terraform" },

    -- tex
    { import = "lazyvim.plugins.extras.lang.tex" },

    -- yaml
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- projects
    { import = "lazyvim.plugins.extras.util.project" },

    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax", "catppuccin", "onedarkpro" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
