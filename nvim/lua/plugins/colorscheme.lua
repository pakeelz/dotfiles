-- return {
--   {
--     "neanias/everforest-nvim",
--     version = false,
--     lazy = false,
--     priority = 1000, -- make sure to load this before all the other start plugins
--     -- Optional; default configuration will be used if setup isn't called.
--     config = function()
--       require("everforest").setup({
--         background = "hard",
--         transparent_background_level = 0,
--         ui_contrast = "high",
--         float_style = "dim",
--       })
--     end,
--   },
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       require("onedark").setup({
--         style = "darker",
--         transparent = false,
--       })
--       require("onedark").load()
--     end,
--   },
-- }
-- return {
--   -- 1. Install the Ayu colorscheme plugin
--   {
--     "shatur/neovim-ayu",
--     lazy = false,
--     priority = 1000, -- Load this before all other plugins
--     config = function()
--       -- Optional: Configure Ayu settings here before loading
--       require("ayu").setup({
--         mirage = false, -- Set to true to use the mirage variant
--         terminal = true, -- Apply Ayu colors to the built-in terminal
--       })
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "ayu",
--     },
--   },
-- }
return {
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
