call plug#begin('~/.vim/plugged')

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Vim-Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Julia-Vim
Plug 'JuliaEditorSupport/julia-vim'
au FileType julia set expandtab softtabstop=4

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"

" Insert closing brackets
Plug 'jiangmiao/auto-pairs'

call plug#end()

set encoding=utf-8
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set signcolumn=yes

syntax on
set number

au FileType yaml set expandtab softtabstop=2
au FileType rust set expandtab softtabstop=4

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go GoFmt

" Bind Ctrl+p to FZF
map <silent> <C-p> <Esc>:Files<CR>
map! <silent> <C-p> <Esc>:Files<CR>

" Make <TAB> auto-select the first completion item
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<tab>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Faster update time
set updatetime=800

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
