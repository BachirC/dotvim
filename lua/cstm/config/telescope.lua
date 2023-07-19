local telescope = require("telescope")
local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")

local find_files = function(_)
	-- Include hidden files and symlinks
	builtin.find_files({ hidden = true, follow = true })
end

local live_grep = function(_)
	telescope.extensions.live_grep_args.live_grep_args()
end

vim.keymap.set("n", "<leader><Space>", find_files, { desc = "[tscope] find files" })
vim.keymap.set("n", "<leader>g", live_grep, { desc = "[tscope] grep in file content" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[tscope] find files in buffer" })
vim.keymap.set("n", "<leader>ch", builtin.command_history, { desc = "[tscope] open vim command history" })

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-h>"] = "which_key", -- Commands list
				["<C-N>"] = actions.cycle_history_next,
				["<C-P>"] = actions.cycle_history_prev,
			},
			n = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "🔍 ",
		sorting_strategy = "descending",
		layout_strategy = "vertical",
		wrap_results = true,
		dynamic_preview_title = true,
		file_sorter = sorters.get_fuzzy_file,
		generic_sorter = sorters.get_generic_fuzzy_sorter,
		winblend = 0,
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		theme = "dropdown",

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = previewers.buffer_previewer_maker,
	},
	pickers = {
		-- Special builtin config goes in here
		buffers = {
			sort_lastused = true,
			previewer = false,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
