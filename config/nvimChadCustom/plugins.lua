local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		lazy = false,
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end,
	},

	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},

	{
		"ThePrimeagen/harpoon",
		lazy = false,
		config = function()
			require("custom.configs.harpoon")
		end,
	},

	{
		"Shatur/neovim-session-manager",
		lazy = false,
		config = function()
			require("custom.configs.session-manager")
		end,
	},

	{ "tpope/vim-surround", lazy = false },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{ "github/copilot.vim", lazy = false },

	{
		"nvim-telescope/telescope.nvim",
		init = function()
			require("telescope").load_extension("ui-select")
		end,
	},

	{ "nvim-telescope/telescope-ui-select.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
	{ "christoomey/vim-tmux-navigator", lazy = false },

	{
		"tpope/vim-fugitive",
		lazy = false,
		config = function()
			require("custom.configs.fugitive")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			"ravenxrz/DAPInstall.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("custom.configs.dap")
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("custom.configs.rust")
			-- code
		end,
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
	},

	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		lazy = false,
		config = function()
			require("distant").setup({
				-- Applies Chip's personal settings to every machine you connect to
				--
				-- 1. Ensures that distant servers terminate with no connections
				-- 2. Provides navigation bindings for remote directories
				-- 3. Provides keybinding to jump into a remote file's parent directory
				["*"] = require("distant.settings").chip_default(),
			})
		end,
	},
	{ "rose-pine/neovim", lazy = false },
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo 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",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   lazy = false,
	-- },
}

return plugins
