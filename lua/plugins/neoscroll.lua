return {
  "karb94/neoscroll.nvim",
  -- event = "WinScrolled",  -- lazy load on scroll
  config = function()
    require("neoscroll").setup {
      -- You can tweak easing functions, duration, etc. here
      easing_function = "quadratic", -- default: "quadratic"
      hide_cursor = true, -- hide cursor while scrolling
      stop_eof = true, -- stop at <EOF>
    }
  end,
}
