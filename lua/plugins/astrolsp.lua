-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  -- we need to use the function notation to get access to the `lspconfig` module
  ---@param opts AstroLSPOpts
  opts = function(plugin, opts)
    -- insert "prolog_lsp" into our list of servers
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "pyrefly")

    -- extend our configuration table to have our new prolog server
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      -- this must be a function to get access to the `lspconfig` module
      pyrefly = {
        -- the command for starting the server
        cmd = {"pyrefly", "lsp"},
        -- the filetypes to attach the server to
        filetypes = { "python" },
        single_file_support = true,
        capabilities = {
          general = { positionEncodings = { "utf-16" } }
        },
        -- root directory detection for detecting the project root
        root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "setup.py"),
      },
      ruff = {
        capabilities = {
          -- Required for compatibility with pyrefly
          general = { positionEncodings = { "utf-16" } }
        }
      }
    })
  end,
}
