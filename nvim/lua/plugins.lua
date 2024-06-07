vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Packer", {clear = true}),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use) 
    -- Packer
    use("wbthomason/packer.nvim")
    
    -- Common utilities
    use("nvim-lua/plenary.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Bluloco theme
    use ({
        'uloco/bluloco.nvim',
        requires = { 'rktjmp/lush.nvim' }
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- File manager
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        filesystem = {
            filtered_items={
                visible=true,
                hide_dotfiles=false,
                hide_gitignored=false,
            },
        },
    })
    -- Git
--    use({
--        "lewis6991/gitsigns.nvim",
--        config = function()
--            require("configs.gitsigns")
--        end,
--    })

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- Abolish
    use("tpope/vim-abolish")

    -- paper-color theme
    use("NLKNguyen/papercolor-theme")

    -- Template.nvim
    use("glepnir/template.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    -- LSP
    use("neovim/nvim-lspconfig")

    -- Auto-complete
   -- use({
   --     "hrsh7th/nvim-cmp",
   --     requires = {
   --         "hrsh7th/vim-vsnip",
   --         "hrsh7th/cmp-buffer",
   --         "hrsh7th/cmp-nvim-lsp",
   --         "hrsh7th/cmp-path",
   --         "hrsh7th/cmp-nvim-lua",
   --         "saadparwaiz1/cmp_luasnip",
   --     }
   -- })

    -- LSPKind
    use("onsails/lspkind-nvim")

    -- LSPInstall
    use("williamboman/nvim-lsp-installer")

    -- Scala lsp
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

    -- LSP signature
    use({"ray-x/lsp_signature.nvim"})

    -- NVim - jdtls
    use({"mfussenegger/nvim-jdtls"})

    -- Coc
    use({'neoclide/coc.nvim', branch= 'release'})

    -- Melange colour scheme
    use({ "savq/melange-nvim" })

    -- Lua LSP server
    use({"sumneko/lua-language-server"})

    -- Git-gh-line
    use({'ruanyl/vim-gh-line'})

    -- Vim tmux navigation 
    use({'christoomey/vim-tmux-navigator'})

    -- Emmet
    use({'mattn/emmet-vim'})

    -- LSPInstall 
    use({'kabouzeid/nvim-lspinstall'})

    -- Tailwind lsp 
    use({'merrickluo/lsp-tailwindcss'})

    -- Formatters 
    use({'stevearc/conform.nvim',
        config = function()
            require("conform").setup()
        end,
    })
    -- Zig lsp. 
    use({
        "NTBBloodbath/zig-tools.nvim",
        ft="zig",
        config=function()
            require("zig-tools").setup()
        end,
    })
    -- Vim be good
    use({'ThePrimeagen/vim-be-good'})
    -- Bash LSP
    use({'bash-lsp/bash-language-server'})
    -- Smooth scroll
    use({'karb94/neoscroll.nvim'})
    -- Surround 
    use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
    -- Gruvbox theme
    use({"ellisonleao/gruvbox.nvim"})
    -- Harpoon
    use({
        "ThePrimeagen/harpoon",
        branch="harpoon2",
        requires={ {"nvim-lua/plenary.nvim"} }
    })
    -- Toggleterm
    use ({"akinsho/toggleterm.nvim", tag = '*', config = function()
          require("toggleterm").setup()
    end})
end)

