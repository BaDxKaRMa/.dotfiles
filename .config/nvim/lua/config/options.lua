-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.foldlevel = 99 -- Open all folds by default
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor

-- let g:python3_host_prog
-- vim.g.python3_host_prog = "/Users/karma/.config/nvim/.virtualenv/nvim-cqsn/bin/python"

-- Treesitter folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.filetype.add({
  extension = {
    zsh = "sh",
    sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
})
