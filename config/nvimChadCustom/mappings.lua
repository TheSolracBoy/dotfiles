---@type MappingsTable
local M = {}

M.disabled = {
	n = {

		["<leader>v"] = "",
		["<leader>w"] = "",
		["<leader>h"] = "",
		["<C-j>"] = "",
		["<C-l>"] = "",
		["<C-k>"] = "",
		["<leader>e"] = "",
		["<leader>b"] = "",
	},
}

M.general = {

	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>w"] = { "<cmd>w<CR>", "Save File", opts = { nowait = true } },
		["<leader>q"] = { "<cmd>q<CR>", "Quit", opts = { nowait = true } },

		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
		["<S-h>"] = { "<cmd> bdprev <CR>", "prev buffer" },
		["<S-l>"] = { "<cmd> bdnext <CR>", "next buffer" },
		["<leader>b"] = { "<cmd> %bd <CR>", "Close all buffers" },

		-- Virtual Text LSP

		-- Lsp
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},

		["<leader>ls"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Document symbols" },

		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

		-- pick a hidden term
		["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

		-- theme switcher
		["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },


	},
}
-- more keybinds!

return M
