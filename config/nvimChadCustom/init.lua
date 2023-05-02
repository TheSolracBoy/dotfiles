-- local autocmd = vim.api.nvim_create_autocmd
--

vim.wo.wrap = false
vim.g.cmp_max_menu_items = 10
vim.keymap.set("n", "mm", "%", { desc = "Get matching symbol" })
vim.keymap.set("v", "mm", "%", { desc = "Get matching symbol" })

-- vim.api.nvim_command("set clipboard=")
vim.opt.clipboard = ""
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })
-- vim.opt.mouse = ""

-- Remap vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down", noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up", noremap = true })

-- Remap search
vim.keymap.set("n", "n", "nzzzv", { desc = "Search down", noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search up", noremap = true })

-- Map redo
vim.keymap.set("n", "U", ":redo<CR>", { desc = "Redo" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>ldf",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Float Diagnostic" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>lk",
	"<cmd>lua vim.diagnostic.goto_prev()<CR>",
	{ noremap = true, silent = true, desc = "Prev Diagnostic" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>lj",
	"<cmd>lua vim.diagnostic.goto_next()<CR>",
	{ noremap = true, silent = true, desc = "Next Diagnostic" }
)
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })

vim.g.copilot_no_tab_map = true
vim.cmd([[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]])
-- asdf

