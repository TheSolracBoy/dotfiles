local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
capabilities.offsetEncoding = { "utf-16" } -- this is the default

-- vim.cmd([[autocmd FileType handlebars setlocal filetype=html]])
-- vim.cmd('autocmd FileType tera setlocal filetype=handlebars')

-- if you just want default config for the servers then put them in a table
local servers = {
	"cssls",
	"tsserver",
	"tailwindcss",
	"bashls",
	"svelte",
	"gopls",
	"jsonls",
	"clangd",
	"intelephense",
	"ember",
	"volar",
	"cmake",
	"csharp_ls",
	"prismals",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "handlebars", "hbs", "html", "javascriptreact", "typescriptreact" },
})

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "handlebars", "html", "css" },
	{
		configurationSection = { "html", "css", "javascript", "handlebasrs" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
})

lspconfig.phpactor.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
})



