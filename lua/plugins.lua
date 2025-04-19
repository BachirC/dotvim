return {
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                        require("cstm.config.treesitter")
                end,
        },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },

        { "alessandroyorba/despacio" }, -- colorscheme

        {
                "neovim/nvim-lspconfig",
                config = function()
                        require("cstm.lsp")
                end,
        },

        { "tpope/vim-unimpaired" },

        {
                "kylechui/nvim-surround",
                --tag = "*", -- Use for stability; omit to use `main` branch for the latest features
                config = function()
                        require("nvim-surround").setup({})
                end
        },

        { "jose-elias-alvarez/typescript.nvim" },
        {
                "nvim-telescope/telescope.nvim",
                tag = '0.1.6',
                branch = '0.1.x',
                dependencies = {
                        { "nvim-lua/plenary.nvim" },
                        { "nvim-telescope/telescope-live-grep-args.nvim" },
                        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
                        config = function()
                                require("telescope").load_extension("fzf")
                        end,
                        },
                },
                config = function()
                        require("cstm.config.telescope")
                end,
        },

        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-nvim-lsp",
                        { "hrsh7th/cmp-cmdline" },
                        { "hrsh7th/cmp-path" },
                        { "hrsh7th/cmp-buffer" },
                        { "hrsh7th/cmp-vsnip" },
                        { "hrsh7th/vim-vsnip" },
                },
                config = function()
                        require("cstm.config.cmp")
                end,
        },
        {
                'lewis6991/gitsigns.nvim',
                config = function()
                        require('cstm.config.gitsigns')
                end,
                dependencies = { "nvim-lua/plenary.nvim" },
        },
        { 'tpope/vim-fugitive' }, -- git wrapper
        { 'tpope/vim-eunuch' }, -- unix helpers
        { 'tpope/vim-rhubarb' }, -- hub wrapper
        { 'tpope/vim-obsession', cmd = { 'Obsession' } }, -- mksession wrapper
        { 'tpope/vim-vinegar' }, -- open file explorer in current split
        { 'nvim-lualine/lualine.nvim' }, -- status line
        { "savq/melange" }, -- colorscheme
        { 'mg979/vim-visual-multi' }, -- multi cursor edition
        { 'tpope/vim-sleuth' },
        { 'mustache/vim-mustache-handlebars' },
        { 'nvim-treesitter/nvim-treesitter-context', config = function()
                require('treesitter-context').setup({
                        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                                -- For all filetypes
                                -- Note that setting an entry here replaces all other patterns for this entry.
                                -- By setting the 'default' entry below, you can control which nodes you want to
                                -- appear in the context window.
                                default = {
                                        'class',
                                        'function',
                                        'method',
                                        'for',
                                        'while',
                                        'if',
                                        'switch',
                                        'case',
                                },
                                typescript = {
                                        'method_definition',
                                        'if_statement',
                                        'arrow_function'
                                }
                        }
                })
        end }, -- keep code context while scrolling
        { 'nvim-treesitter/playground' },
        { 'zbirenbaum/copilot.lua',
                event = 'VimEnter',
                config = function()
                        vim.defer_fn(function()
                                require('copilot').setup({

                                        filetypes = {
                                                typescript = true,
                                                yaml = false,
                                                markdown = false,
                                                help = false,
                                                gitcommit = false,
                                                gitrebase = false,
                                                hgcommit = false,
                                                svn = false,
                                                cvs = false,
                                                ["."] = false,
                                        },
                                        panel = {
                                          auto_trigger = true,
                                        },
                                        suggestion = {
                                                enabled = true,
                                                auto_trigger = true,
                                                debounce = 75,
                                                keymap = {
                                                        accept = "<C-f>",
                                                        accept_word = "<C-f>",
                                                        accept_line = "<C-f>",
                                                        next = "<C-l>",
                                                        prev = "<C-b>",
                                                },
                                        },
                                })
                        end, 100)
                end,
        },
        {
                "yetone/avante.nvim",
                event = "VeryLazy",
                lazy = false,
                version = false, -- set this if you want to always pull the latest change
                opts = {
                        provider = "copilot",
                        copilot = {
                                model = "claude-3.5-sonnet",
                                -- max_tokens = 4096,
                        },
                        file_selector = {
                                --- @alias FileSelectorProvider "native" | "fzf" | "telescope" | string
                                provider = "telescope",
                                -- Options override for custom providers
                                provider_opts = {},
                        },
                },
                -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
                build = "make",
                -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
                dependencies = {
                        "nvim-treesitter/nvim-treesitter",
                        "stevearc/dressing.nvim",
                        "nvim-lua/plenary.nvim",
                        "MunifTanjim/nui.nvim",
                        --- The below dependencies are optional,
                        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
                        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                        "zbirenbaum/copilot.lua", -- for providers='copilot'
                        {
                                -- support for image pasting
                                "HakonHarnes/img-clip.nvim",
                                event = "VeryLazy",
                                opts = {
                                        -- recommended settings
                                        default = {
                                                embed_image_as_base64 = false,
                                                prompt_for_file_name = false,
                                                drag_and_drop = {
                                                        insert_mode = true,
                                                },
                                                -- required for Windows users
                                                use_absolute_path = true,
                                        },
                                },
                        },
                        {
                                -- Make sure to set this up properly if you have lazy=true
                                'MeanderingProgrammer/render-markdown.nvim',
                                opts = {
                                        file_types = { "markdown", "Avante" },
                                },
                                ft = { "markdown", "Avante" },
                        },
                },
}
}
