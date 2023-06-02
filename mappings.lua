---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>ss"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and Replace RegExp" },
    ["<C-p>"] = {
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- tmux
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", desc = "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", desc = "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", desc = "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", desc = "window up" },
  },
  v = {
    ["J"] = { ":m '>+1<cr>gv=gv" },
    ["K"] = { ":m '<-2<cr>gv=gv" },
  },
}

-- more keybinds!

return M
