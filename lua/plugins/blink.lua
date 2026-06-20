--- @type LazySpec
return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      -- ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
      -- ["<S-Tab>"] = { "snippet_backward", "fallback" },

      -- Tab hijacking fix
      -- ["<Tab>"] = {
      --   function(cmp)
      --     if cmp.is_visible() then
      --       return cmp.accept()
      --     elseif cmp.snippet_active { direction = 1 } then
      --       return cmp.snippet_forward()
      --     else
      --       return false -- force blink to move to the next item in the array ("fallback")
      --     end
      --   end,
      --   "fallback",
      -- },
      -- ["<S-Tab>"] = {
      --   function(cmp)
      --     if cmp.snippet_active { direction = 1 } then
      --       return cmp.snippet_backward()
      --     else
      --       return false
      --     end
      --   end,
      --   "fallback",
      -- },

      -- Re-route <Tab> jump completion
      ["<Tab>"] = {
        function()
          local blink = package.loaded["blink.cmp"]
          if blink and blink.is_visible() then
            blink.select_next()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
          end
        end,
      },
      -- Move snippet jump
      ["<S-l>"] = { "accept", "snippet_forward", "fallback" },
      ["<S-h>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      list = { selection = { preselect = true, auto_insert = true } },
      menu = {
        draw = {
          columns = {
            { "kind_icon", "label", gap = 1 },
          },
          components = {
            label = {
              text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
              highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
            },
          },
        },
      },
    },
    sources = {
      providers = {
        path = { opts = { trailing_slash = false, show_hidden_files_by_default = true } },
      },
    },
    signature = { enabled = true },
  },
}
