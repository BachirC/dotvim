local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.actionlint, -- Github actions
	null_ls.builtins.diagnostics.jsonlint,

	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.jq,
	null_ls.builtins.formatting.fixjson,

	null_ls.builtins.code_actions.eslint_d,
}

local on_local_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 10000 })
			end,
		})
	end
end

null_ls.setup({ sources = sources, on_attach = on_local_attach })
