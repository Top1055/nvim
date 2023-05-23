-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope for fuzzy file finder
	-- 	keybinds:
	-- 		search file: space+pf
	-- 		search text: space+ps
	-- 		search git: space+pg
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Colorschemes
    -- catppuccin
    use ({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

	-- Rode pine colorscheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine-moon',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	-- Syntax highlighting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	-- Prime Harpoon
	-- 	keybinds:
	-- 		add file: space+a
	-- 		view files: control+e
	use('theprimeagen/harpoon')

	-- Undo tree
	-- 	keybind: space+u
	use('mbbill/undotree')

	-- Git status
	-- 	keybind: space+gs
	use('tpope/vim-fugitive')

    -- Tmux controls
    use('christoomey/vim-tmux-navigator')

    -- NNN file usage
    use('mcchrish/nnn.vim')

    -- Lualine
    use('nvim-lualine/lualine.nvim')

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        wants = { "nvim-lsp-installer" },
        config = function()
            require("top1055.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
        },
    }

end)
