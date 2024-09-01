return {
  {
    "github/copilot.vim",
    lazy = false,
    keys = {
      {
        "<C-j>",
        'copilot#Accept("\\<CR>")',
        expr = true,
        replace_keycodes = false,
        mode = "i",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    keys = {
      {
        "<leader>wcc",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
      },
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
