return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
      "CodeCompanionCmd",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Настройка стратегий (где юзается адаптер)
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        agent = { adapter = "ollama" },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "gemma4:e4b", -- Модель по умолчанию
                -- ДОБАВЛЯЕМ ВЫБОР МОДЕЛЕЙ ТУТ:
                choices = {
                  "gemma4:e4b",
                  "qwen3.5:4b",
                },
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = 4096,
              },
            },
          })
        end,
      },
    },
    keys = {
      { "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat (Ollama)", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>CodeCompanionChat Add<cr>", desc = "Add code to AI Chat", mode = "v" },
    },
  },
}
