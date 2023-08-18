local null_ls = require("null-ls")
local null_helper = require("null-ls.helpers")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local python = {
--     method = null_ls.methods.FORMATTING,
--     filetypes = {"python"},
--     generator = null_ls.generator({
--         command = "black",
--         args = {"--stdin"}
--     })
-- }
local format = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = true })
				end,
			})
		end
	end,
	sources = {
		format.prettier,
		format.black,
		format.isort,
		format.autoflake,
		format.stylua,
		format.goimports,
		format.sqlfmt,

		diag.mypy,
		diag.ruff,
		diag.golangcilint,
	},
})
