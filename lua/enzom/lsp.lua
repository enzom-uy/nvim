local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local lsp_installer = require("nvim-lsp-installer")
local servers = {
	"eslint",
	"jsonls",
	"tsserver",
	"sumneko_lua",
	"gopls",
}

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	signs = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		prefix = " ",
	},
})

local success_lsputils, lsputils_codeAction = pcall(require, "lsputil.codeAction")
if success_lsputils then
	if vim.fn.has("nvim-0.6") == 1 then
		vim.lsp.handlers["textDocument/codeAction"] = lsputils_codeAction.code_action_handler
	else
		vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
			lsputils_codeAction.code_action_handler(nil, actions, nil, nil, nil)
		end
	end
end

local function on_attach(client)
	for _, server in ipairs(servers) do
		local server_name = server
		if client.name == server_name then
			client.resolved_capabilities.document_formatting = false
		end
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Only load cmp lsp capabilities when avaiabled
-- in case you uninstall nvim-cmp
local success_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if success_cmp_lsp then
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			server:install()
		end
	end
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
		flags = {
			debounce_text_changes = 150,
		},
	})
end

lspconfig.tsserver.setup({
	capabilities = capabilities,
	init_options = {
		hostInfo = "neovim",
	},
	on_attach = on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
})

lspconfig.rust_analyzer.setup({})
lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lspconfig["gopls"].setup({
	cmd = { "gopls" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
})
