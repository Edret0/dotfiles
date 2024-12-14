local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        version = '0.1.8',
        dependencies =
        {
            {
                'nvim-lua/plenary.nvim',
                lazy = false,
            },
            {
                -- ripgrep
            },
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        enable = false,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()

            --config setup here

            require("solarized-osaka").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            })



            --vim.cmd([[colorscheme solarized-osaka]])
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require('nvim-treesitter.parsers').get_parser_configs().asm = {
                install_info = {
                    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
            }
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "java","c_sharp","c", "lua", "vim", "vimdoc", "query","javascript","asm" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,


                highlight = {
                    enable = true,


                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }

        end
    },
    {"ThePrimeagen/harpoon", branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"}},
    "mbbill/undotree",
    "tpope/vim-fugitive",
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {
        'L3MON4D3/LuaSnip',
        version = "2.*",
        build="make install_jsregexp",
    },
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {"prichrd/netrw.nvim"},



    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            --vim.cmd([[colorscheme tokyonight]])
            --vim.cmd("hi Comment gui=None")
        end
    },
    {
        'maxmx03/fluoromachine.nvim',
        config = function ()
            local fm = require 'fluoromachine'

            fm.setup {
                brightness = 0.04,
                glow = false,
                theme = 'delta',
                transparent = true,
                override = {
                    ['@type'] = { italic = true, bold = false },
                    ['@function'] = { italic = false, bold = false },
                    ['@comment'] = { italic = true },
                    ['@keyword'] = { italic = true, bold = true},
                    ['@constant'] = { italic = false, bold = false },
                    ['@variable'] = { italic = true },
                    ['@field'] = { italic = true },
                    ['@parameter'] = { italic = true },
                    -- TelescopeResultsBorder = { fg = alt_bg, bg = alt_bg },
                    -- TelescopeResultsNormal = { bg = alt_bg },
                    -- TelescopePreviewNormal = { bg = bg },
                    -- TelescopePromptBorder = { fg = alt_bg, bg = alt_bg },
                    -- TelescopeTitle = { fg = fg, bg = comment },
                    -- TelescopePromptPrefix = { fg = purple },
                }
            }

            vim.cmd.colorscheme 'fluoromachine'
        end
    },
    {"github/copilot.vim"},
    {
        "j-hui/fidget.nvim",
        tag ="v1.2.0",
        opts = {

        },
    },
    {"mfussenegger/nvim-jdtls"},
    -- my own created plugins start 
    {
        dir = "/home/edret/nvim-plugins/stackmap.nvim",
        name="stackmap"
    },
    {
        name = "take-a-break",
        dir = "/home/edret/nvim-plugins/take-a-break.nvim",
        dependencies = {
            {
                {"j-hui/fidget.nvim"},
            },
        },
    },

    -- end of created plugins
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    -- arduino plugins
    {
        "sudar/vim-arduino-syntax"
    },
    -- end of arduino plugins

    -- asm plugins start
    -- asm plugins end
    { 'rush-rs/tree-sitter-asm' },
    {"nvim-telescope/telescope-ui-select.nvim"},
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


},{})
