local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    { "hrsh7th/nvim-cmp" },
    { "neovim/nvim-lspconfig" },
    { "windwp/nvim-autopairs" },
    { "jwalton512/vim-blade" },
    { "windwp/nvim-ts-autotag" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "noahfrederick/vim-laravel" },
    { "phpactor/phpactor", run = "composer install --no-dev -o" },
    { "pangloss/vim-javascript" },
    { "mxw/vim-jsx" },
    { "sbdchd/neoformat" },
    { "nvim-tree/nvim-web-devicons" },
    { "tribela/vim-transparent" },
    -- Plugins adicionales
    { import = "plugins.twilight" },

    --estas configuraciones tambien
    ---- Configuración de Nvim Tree
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
          renderer = {
            icons = {
              show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
              },
            },
          },
        })
      end,
    },

    -- Configuración de Telescope con iconos
    {
      "nvim-telescope/telescope.nvim",
      config = function()
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = { "node_modules" },
            mappings = {
              i = {
                ["<C-u>"] = false, -- ejemplo de mapeo
              },
            },
            layout_config = {
              horizontal = {
                width = 0.8,
                height = 0.9,
              },
            },
            extensions = {
              ["themes"] = {
                icons = { enabled = true }, -- Activar iconos en Telescope
              },
            },
          },
        })
      end,
      -- Configuración de Lualine con iconos
      {
        "nvim-lualine/lualine.nvim",
        config = function()
          require("lualine").setup({
            options = {
              icons_enabled = true, -- Habilitar iconos
              theme = "tokyonight", -- Tema para Lualine
            },
          })
        end,
      },
    },
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
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
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
