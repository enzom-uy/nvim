return {
  {
    "echasnovski/mini.bufremove",
  -- stylua: ignore
  keys = {
    { "<C-d>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
  },
  },
}
