local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- vscode like icons
	use("nvim-tree/nvim-web-devicons")
	-- essential for other plugins
	use("nvim-lua/plenary.nvim")
	-- theme
	use("folke/tokyonight.nvim")
	-- file explorer
	use({ "nvim-tree/nvim-tree.lua", tag = "nightly" })
	-- fuzzy finder
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	-- cmp plugins
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lua")
	-- snippets
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")
	-- Dim Unused Variables
	use("zbirenbaum/neodim")
	-- Commenting
	use("numToStr/Comment.nvim")
	-- statusline
	use("nvim-lualine/lualine.nvim")
	-- tabline
	use("romgrk/barbar.nvim")
	-- css colors
	use("norcalli/nvim-colorizer.lua")
	-- surround
	use("tpope/vim-surround")
	-- treesitter configuration
	use({ "nvim-treesitter/nvim-treesitter" })
	-- auto closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
