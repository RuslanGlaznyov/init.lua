require("ruslan.plugins-setup")
require("ruslan.plugins._telescope")
require("ruslan.core.options")
require("ruslan.core.color")
require("ruslan.core.keymaps")
require("ruslan.plugins.nvim-tree")
require("ruslan.plugins.lualine")
require("ruslan.plugins.lsp")
require("ruslan.plugins.treesitter")
require("ruslan.plugins.autopairs")
require("ruslan.plugins.gitsingns")
require("ruslan.core.commands")
--- Copilot completion by word
vim.cmd [[
function! SuggestOneCharacter()
    let suggestion = copilot#Accept("")
    let bar = copilot#TextQueuedForInsertion()
    return bar[0]
endfunction

function! SuggestOneWord()
    let suggestion = copilot#Accept("")
    let bar = copilot#TextQueuedForInsertion()
    return split(bar, '[ .]\zs')[0]
endfunction

imap <script><expr> <C-l> SuggestOneWord()
]]
