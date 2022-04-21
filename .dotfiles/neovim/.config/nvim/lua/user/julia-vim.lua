-- local status_ok, jlvim = pcall(require, "julia-vim")
-- if not status_ok then
--   print('could not load julia-vim')
--   return
-- end

vim.cmd[[
  let g:latex_to_unicode_auto = 1
  let g:latex_to_unicode_tab = 0
  let g:latex_to_unicode_cmp_mapping = ['<C-J>']
  " let g:LanguageClient_autoStart = 0
  " let g:LanguageClient_serverCommands = {
  "       \   'julia': ['julia', '--startup-file=yes', '--history-file=no', '-e', '
  "       \       using LanguageServer;
  "       \       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
  "       \       server.runlinter = false;
  "       \       run(server);
  "       \   '],
  "       \ }
]]

--jlvim.setup{}
