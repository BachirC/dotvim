local on_attach = function(client)
	if not client.server_capabilities.typeDefinitionProvider then return end

	vim.keymap.set("n", "<C-,>", vim.lsp.buf.type_definition, { desc = "[lsp] type definition" })
end

return {
	on_attach = on_attach,
}
