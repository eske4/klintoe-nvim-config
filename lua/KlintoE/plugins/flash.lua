return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>fs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader>fS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<leader>ft", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>f"] = {
          name = "Flash quick code search",
          s = "Flash",
          S = "Flash Treesitter",
          t = "Treesitter Search",
        },
      })
    end
  }
}
