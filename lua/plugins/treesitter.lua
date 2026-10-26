-- Customize Treesitter

---@type LazySpec
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()

			-- Temporary workaround: Stop tree-sitter highlighting for markdown
			-- files until the upstream markdown parser query syntax is fixed for Neovim 0.12.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown" },
				callback = function()
					vim.treesitter.stop()
				end,
			})
		end,
		-- old config
		-- opts = {
		--   indent = {
		--     disable = { "yaml" },
		--   },
		-- },
	},
}
