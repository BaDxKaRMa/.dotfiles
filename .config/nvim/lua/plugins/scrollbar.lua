return {
  -- add symbols-outline
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "kevinhwang91/nvim-hlslens" },
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end,
  },
}
