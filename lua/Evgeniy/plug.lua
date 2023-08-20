local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- packer itself
	use({ "nvim-lua/plenary.nvim" }) -- a lot of stuff needs it
	use({ "kyazdani42/nvim-web-devicons" }) -- icons for lualine mainly
	use({ "moll/vim-bbye" }) -- allows closing buffers without fucing up windows layout
	use({ "lukas-reineke/indent-blankline.nvim" }) -- correct indentation
	use({ "nvim-lualine/lualine.nvim" }) --lualine
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use("rlch/github-notifications.nvim")
	use("szw/vim-maximizer")
	use("prichrd/netrw.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")

	-- TreeSitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",

		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")
	-- DAP and debuggers
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("mfussenegger/nvim-dap-python")
	use("rcarriga/nvim-dap-ui")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "theprimeagen/harpoon" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use("lunarvim/darkplus.nvim")
	use("NLKNguyen/papercolor-theme")
	use("rebelot/kanagawa.nvim")

	--Neodev
	use("folke/neodev.nvim")
end)
