local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"pyright",
})
-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-,>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-.>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = false }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "",
		warn = "",
		info = "",
		hint = "",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.format_on_save({
	format_opts = {
		async = true,
		timeout_ms = 10000,
	},
	servers = {
		["black"] = { "python" },
		["goimports"] = { "go" },
	},
})
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
local lspconfig = require("lspconfig")
lspconfig.gleam.setup({
	cmd = { "gleam", "lsp" },
	filetypes = { "gleam" },
	root_dir = lspconfig.util.root_pattern("gleam.toml", ".git"),
	-- capabilities = require("user.lsp.handlers").capabilities,
})
local metals_config = require("metals").bare_config
metals_config.setup()
