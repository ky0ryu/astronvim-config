return {
	{
		"stevearc/aerial.nvim",
		opts = {
			-- Exclude "treesitter" to prevent the nil method crash
			backends = { "lsp", "markdown", "asciidoc", "man" },
		},
	},
}
