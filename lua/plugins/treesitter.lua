-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Ensure Go and core parsers are installed
      pcall(function() require("nvim-treesitter").install { "go", "gomod", "gosum", "lua" } end)

      -- Safely start treesitter highlighting for code buffers
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("SafeTreesitterStart", { clear = true }),
        pattern = { "go", "gomod", "gosum", "lua" },
        callback = function(args)
          if vim.bo[args.buf].buftype == "" then pcall(vim.treesitter.start, args.buf) end
        end,
      })
    end,
  },
}
