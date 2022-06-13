local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.brittany,
	formatting.eslint_d,
	formatting.markdownlint,
	formatting.prettier,
	formatting.rustfmt,
	formatting.stylua,
}

null_ls.setup({
	--> Auto-format on Save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
		end
	end,
	debug = false,
	sources = sources,
})
