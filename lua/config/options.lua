vim.o.mouse = ''
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.inccommand = 'nosplit'
vim.o.backspace = 'indent,eol,start'
vim.o.number = true
vim.o.termguicolors = true

if vim.fn.executable('rg') == 1 then
    vim.o.grepprg="rg --vimgrep --hidden --glob ‘!.git’"
end
