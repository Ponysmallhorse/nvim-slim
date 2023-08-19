require("neodev").setup({
	library = {
		enabled = false,
	},
	setup_jsonls = false,
})

local lspconf = require("lspconfig")

lspconf.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnipper = "Replace",
			},
		},
	},
})
