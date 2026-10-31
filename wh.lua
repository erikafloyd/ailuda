return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = { adapter = "my_gateway" },
        inline = { adapter = "my_gateway" },
      },
      adapters = {
        my_gateway = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              -- Переменная окружения, откуда плагин будет брать токен
              api_key = "MY_GATEWAY_API_KEY", 
            },
            url = "https://your-ai-gateway.com", -- URL вашего шлюза
            schema = {
              model = {
                default = "gpt-4o", -- Укажите ID модели, которую отдает ваш шлюз
              },
            },
          })
        end,
      },
    })

    -- Горячие клавиши
    vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<leader>cc", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  end,
}