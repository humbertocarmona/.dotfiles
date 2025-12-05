vim.lsp.config("julials", {
  cmd = {
    "julia",
    "--project=" .. "~/.julia/environments/nvim-lspconfig",
    "--startup-file=no",
    "--history-file=no",
    "-e",
    [[
       using Pkg
       Pkg.instantiate()
       using LanguageServer,SymbolServer, StaticLint
       depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
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
  filetypes = { "julia" },
  root_markers = { "Project.toml", "JuliaProject.toml" },
  settings = {},
})

vim.lsp.enable("julials")
