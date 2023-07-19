local gs = require("gitsigns")

-- Navigate around hunks
local next = function()
  gs.next_hunk({ wrap = false })
end

local prev = function()
  gs.prev_hunk({ wrap = false })
end

local on_attach = function(_)
	if not vim.o.diff then
		vim.keymap.set('n', ']s', next, { buffer = true, desc = '[git] go to next hunk' })
		vim.keymap.set('n', '[s', prev, { buffer = true, desc = '[git] go to prev hunk' })
	end

	vim.keymap.set('n', '<leader>sa', gs.stage_hunk, { buffer = true, desc = '[git] stage hunk' })
	vim.keymap.set('n', '<leader>su', gs.undo_stage_hunk, { buffer = true, desc = '[git] undo stage hunk' })
	vim.keymap.set('n', '<leader>sp', gs.preview_hunk, { buffer = true, desc = '[git] preview hunk' })
	vim.keymap.set('n', '<leader>sd', gs.reset_hunk, { buffer = true, desc = '[git] reset hunk' })
end

gs.setup({
	signs = {
		add          = { hl = 'GitSignsDiffAdd', text = '┃' },
		change       = { hl = 'GitSignsChange', text = '┃' },
		delete       = { hl = 'GitSignsDelete', text = '┃' },
		topdelete    = { hl = 'GitSignsDelete', text = '┃' },
		changedelete = { hl = 'GitSignsChange', text = '┃' },
	},
	on_attach = on_attach,
	current_line_blame = true,
  current_line_blame_opts = { delay = 500 },
})
