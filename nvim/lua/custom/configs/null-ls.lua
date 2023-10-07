local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	b.formatting.prettier.with({
		filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	}),
	b.formatting.stylua,
}

null_ls.setup({
	sources = sources,
})
