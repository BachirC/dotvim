local setup = function(on_attach)
	local on_local_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})

		on_attach(client, bufnr)
	end
	require 'lspconfig'.eslint.setup({
		settings = {
			packageManager = 'yarn'
		},
		on_attach = on_local_attach
	})
end

return { setup = setup }
