local lspconfig = require("lspconfig")
local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"

-- 1. Setup the Wildcard (Capabilities for ALL servers)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
	capabilities = cmp_lsp.default_capabilities()
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- 2. Your specific settings ONLY
local servers = {
	ts_ls = {},
	html = {},
	lua_ls = {},
	omnisharp = {
		cmd = { bin_locations .. "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
	},
	vimls = {},
	cssls = {},
	somesass_ls = {},
	pyright = {},
	yamlls = {},
	jsonls = {},
	docker_compose_language_service = {},
	dockerls = {},
	neocmakelsp = {
		init_options = { format = { enable = true }, lint = { enable = true } },
	},
	bashls = {},
	angularls = {},
	arduino_language_server = {},
	svelte = {},
	tailwindcss = {},
	hls = {},
}

-- 3. The Standalone Loop
for server_name, config in pairs(servers) do
	-- Register the specific settings
	vim.lsp.config(server_name, config)
	-- Launch the server
	lspconfig[server_name].setup({})
end
