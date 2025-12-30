-- 1. Define the function at the top so every plugin can see it
local function ColorMyPencils(color)
  -- Default to tokyonight if nothing is passed
  color = color or "tokyonight"

  -- Try to load the colorscheme safely
  local ok, _ = pcall(vim.cmd.colorscheme, color)
  if not ok then
    -- If the theme fails to load (maybe not installed yet), don't crash
    return
  end

  -- Apply your transparency overrides consistently
  local hl_groups = { "Normal", "NormalFloat", "LineNr", "CursorLine" }
  for _, group in ipairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

return {
  -- Essential for loading colorschemes correctly in lazy.nvim
  { "erikbackman/brightburn.vim" },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false,
      theme = "lotus",
      background = { dark = "lotus", light = "lotus" },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      })

      -- ACTIVATE THE THEME HERE
      ColorMyPencils("tokyonight")
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        bold = true,
        contrast = "hard",
      })
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    config = function()
      require("github-theme").setup({})
      -- To use this theme, move ColorMyPencils("github_dark") here
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
        },
      })

      -- If you want to switch to catppuccin, uncomment the line below
      -- and comment out the one in tokyonight
      -- ColorMyPencils("catppuccin")
    end,
  },
}
