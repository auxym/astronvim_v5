return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          -- ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          -- ["<Leader>bD"] = {
          --   function()
          --     require("astroui.status").heirline.buffer_picker(function(bufnr)
          --       require("astrocore.buffer").close(bufnr)
          --     end)
          --   end,
          --   desc = "Pick to close",
          -- },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- ["<Leader>b"] = { desc = "Buffers" },
          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          -- System clipboard
          -- Note: Shift-P to paste from system clipboard
          ["cp"] = {'"+y', desc = "Copy to system clipboard"},
          ["cpp"] = {'"+yy', desc = "Copy line to system clipboard"},
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
        v = {
          -- Copy to system clipboard
          ['<C-c>'] = {'"+y', desc = "Copy to system clipboard"},
        }
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
