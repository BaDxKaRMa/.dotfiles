-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "ii", "<esc>", { desc = "Escape" })
map("n", "q", "<cmd>Bdelete<cr>", { desc = "Close buffer" })
map("n", "Q", "<cmd>qa<cr>", { desc = "Quit" })
map("n", "d", '"_d', { desc = "Delete without yanking" })
map("v", "d", '"_d', { desc = "Delete without yanking" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
map("i", "<c-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "LSP Signature Help" })
map("n", "<leader>p", "<cmd>!python %<cr>", { desc = "Run python file" })
map("n", "<leader>ct", "<cmd>CloakToggle<cr>", { desc = "Toggle cloak" })
