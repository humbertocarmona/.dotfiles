local util = require("lspconfig.util")

-- Configure the Julia LSP
vim.lsp.config("julials", {
  cmd = {
    "julia",
    "--project=@.", -- <<< use Project.toml from the project root
    "--startup-file=no",
    "--history-file=no",
    "-e",
    [[
      using Pkg;
      import LanguageServer, SymbolServer, StaticLint;

      # Use the active project (from --project=@.)
      depot_path = get(ENV, "JULIA_DEPOT_PATH", "");
      project_path = dirname(Pkg.Types.Context().env.project_file);

      @info "Running language server" VERSION pwd() project_path depot_path

      server = LanguageServer.LanguageServerInstance(
        stdin,
        stdout,
        project_path,
        depot_path,
      );
      server.runlinter = true;
      run(server);
    ]],
  },

  -- Tell Neovim how to find the project root
  root_dir = util.root_pattern("Project.toml", ".git", "."),
})

-- Actually start the server
vim.lsp.enable("julials")
