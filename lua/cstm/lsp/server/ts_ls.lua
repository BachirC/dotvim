local setup = function(on_attach)
	local on_local_attach = function(client, bufnr)
		-- let null-ls handle it
		client.server_capabilities.documentFormattingProvider = false

		on_attach(client, bufnr)
	end

	require("typescript").setup({
		disable_commands = false, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		server = { -- pass options to lspconfig's setup method
			on_attach = on_local_attach
		},
	})

end

return { setup = setup }
