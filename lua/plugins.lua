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
                        { "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
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
                                        copilot_node_command = vim.fn.expand("$HOME") ..
                                                "/.nvm/versions/node/v16.15.0/bin/node",
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
        }
}
