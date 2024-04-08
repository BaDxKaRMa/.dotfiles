return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        lua = true,
        python = true,
        javascript = true,
        help = true,
        ps1 = true,
        typescript = true,
        html = true,
        css = true,
        vim = true,
        sh = true,
        zsh = true,
        ["*"] = false,
      },
    },
  },
}
