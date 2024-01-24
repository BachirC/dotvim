local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	null_ls.builtins.diagnostics.actionlint, -- Github actions
	null_ls.builtins.diagnostics.jsonlint,

	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.jq,
	null_ls.builtins.formatting.fixjson,

	null_ls.builtins.code_actions.eslint_d,
}

null_ls.setup({ sources = sources })
