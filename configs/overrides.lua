local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

local function edit_or_open()
  -- open as vsplit on current node
  local action = "edit"
  local node = lib.get_node_at_cursor()

  -- Just copy what's done normally with vsplit
  if node.link_to and not node.nodes then
    require("nvim-tree.actions.node.open-file").fn(action, node.link_to)
    view.close() -- Close the tree if file was opened
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
  else
    require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)
    view.close() -- Close the tree if file was opened
  end
end

-- git support in nvimtree
M.nvimtree = {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
        { key = "l", action = "edit",      action_cb = edit_or_open },
        -- { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "h", action = "close_node" },
        -- { key = "H", action = "collapse_all", action_cb = collapse_all },
      },
    },
  },

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
