-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("ellisonleao/gruvbox.nvim") -- preferred colorscheme
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("tpope/vim-surround") -- add, delete, change surroundings
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("kyazdani42/nvim-web-devicons") -- vs-code like icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
    use("tpope/vim-repeat")
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use('neovim/nvim-lspconfig')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-cmdline')
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("onsails/lspkind.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
