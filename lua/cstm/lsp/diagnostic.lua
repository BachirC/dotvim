local format_message = function(diagnostic)
	if diagnostic.code then
		return string.format("%s: %s", diagnostic.code, diagnostic.message)
	end

	return diagnostic.message
end

local options = { noremap = true, silent = true }
local on_attach = function(_)
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	vim.diagnostic.config({
		virtual_text = {
			source = "if_many",
			format = format_message,
		},
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	})
end

-- Initialize toggle flag.
vim.b.lsp_diagnostic_enabled = true
local toggle = function()
	if vim.b.diagnostic_displayed then
		vim.diagnostic.hide(nil, 0)
	else
		vim.diagnostic.show(nil, 0)
	end

	vim.b.diagnostic_displayed = not vim.b.diagnostic_displayed
end

local next = function()
	vim.diagnostic.goto_next({ wrap = true })
end

local prev = function()
	vim.diagnostic.goto_prev({ wrap = true })
end


-- Navigate around errors or warnings.
vim.keymap.set('n', '[d', prev, { desc = "[diagnostic] go to prev" })
vim.keymap.set('n', ']d', next, { desc = "[diagnostic] go to next" })
vim.keymap.set('n', '<leader>dt', toggle, { desc = "[diagnostic] toggle display of diagnostic" })

return {
	on_attach = on_attach,
}
