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
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.cmp = {
	sources = {
		{ name = "luasnip", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 25 },
		{ name = "buffer", max_item_count = 5 },
		{ name = "nvim_lua", max_item_count = 6 },
		{ name = "path", max_item_count = 15 },
	},
	sorting = {
		-- require("clangd_extensions.cmp_scores"),
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",
		"prettier",
		"emmet-ls",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"eslint-lsp",
		"emmet-ls",
		"prettier",
		"typescript-language-server",
		"deno",
		"prettier",
		"svelte-language-server",
		"tailwindcss-language-server",

		-- c/cpp stuff
		"clangd",
		"clang-format",
		"codelldb",
		"cpptools",
		"cpplint",
		"css-lsp",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
  view ={
    side = "right",
  },
	renderer = {
		highlight_git = false,
		icons = {
			show = {
				git = false,
			},

		-- glyphs = {
  --       default = "󰈚",
  --       symlink = "",
  --       folder = {
  --         default = "",
  --         empty = "",
  --         empty_open = "",
  --         open = "",
  --         symlink = "",
  --         symlink_open = "",
  --         arrow_open = "",
  --         arrow_closed = "",
  --       },
  --       git = {
  --         unstaged = "✗",
  --         staged = "✓",
  --         unmerged = "",
  --         renamed = "➜",
  --         untracked = "★",
  --         deleted = "",
  --         ignored = "◌",
  --       },
      -- },
    },
	},
}

return M
