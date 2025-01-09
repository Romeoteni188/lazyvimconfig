-- This file contains the configuration for the twilight.nvim plugin in Neovim.

-- return {
--     -- Plugin: twilight.nvim
--     -- URL: https://github.com/folke/twilight.nvim
--     -- Description: A Neovim plugin for dimming inactive portions of the code you're editing.
--     "folke/twilight.nvim",
--   }

return {
  -- Plugin: nvim-colorizer.lua
  -- URL: https://github.com/NvChad/nvim-colorizer.lua
  -- Description: A Neovim plugin for colorizing color codes in your code (supports tailwind).
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  }, 
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,  -- Habilita soporte para Tailwind CSS
      },
    },
  },

  -- Plugin: twilight.nvim
  -- URL: https://github.com/folke/twilight.nvim
  -- Description: A Neovim plugin for dimming inactive portions of the code you're editing.
  {
    "folke/twilight.nvim",
    opts = {
      -- Aquí puedes agregar opciones de configuración adicionales si lo deseas
    },
  },
}
