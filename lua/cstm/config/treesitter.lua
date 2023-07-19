require('nvim-treesitter.configs').setup({
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>tn"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>tp"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]c"] = "@call.outer",
			},
			goto_previous_start = {
				["[c"] = "@call.outer",
			},
		},
	},
	ensure_installed = {
		"bash",
		"c",
		"comment",
		"css",
		"dockerfile",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"tsx",
		"typescript",
		"vim",
		"yaml"
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	sync_install = false,

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	endwise = {
		enable = true,
	},
})
