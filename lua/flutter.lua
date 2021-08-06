vim.api.nvim_set_keymap('n', '<Leader>fr',':FlutterRun<CR>'
, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fc',
[[<Cmd>lua require('telescope').extensions.flutter.commands()<CR>]],
{ noremap = true, silent = true })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;


require("flutter-tools").setup{

lsp = {
    capabilities = capabilities,                                                                    }
}

vim.g.vsnip_snippet_dir = 'C:\\Users\\jithu\\AppData\\Local\\nvim\\snippets\\';

-- LSP Enable diagnostics
 vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
   })

   local saga = require 'lspsaga'
saga.init_lsp_saga {
error_sign = '➤',
warn_sign = '➤',
hint_sign = '➤',
infor_sign = '➤',
code_action_icon = '',
code_action_keys = {
  quit = '<ESC>',exec = '<CR>'
  },
}
vim.api.nvim_set_keymap('n', '<Leader>ca',':Lspsaga code_action<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fe',':Lspsaga diagnostic_jump_next<CR>',
{ noremap = true, silent = true })
-- autoformat on save
vim.cmd 'au BufWritePre *.dart :DartFmt'
