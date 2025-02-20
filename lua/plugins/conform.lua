return {
  "stevearc/conform.nvim",
  opts = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        javascript = { "prettierd" },
        typescript = { "prettierd", "prettier" },
        prisma = { "prettierd", "prettier" },
        json = { "prettierd" },
      },
    })
  end,
}
