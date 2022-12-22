-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- Mappings.
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local keymap = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
	keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
	keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
	keymap("n", "<leader>li", "<cmd>LspInfo<cr>", bufopts)
	keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", bufopts)
	keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)
	keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", bufopts)
	keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", bufopts)
	keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
	keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
	keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts)
end

-- Customize Diagnostcs
vim.diagnostic.config({
	virtual_text = false, -- disable virtual text
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		source = "always",
	},
})

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
