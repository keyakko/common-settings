
"##########################
" Plugin Manager
"##########################
noremap ; :
nnoremap s <Nop>
map sf :split<CR>
map sg :vsplit<CR>
map sk <C-w>k
map sj <C-w>j
map sh <C-w>h
map sl <C-w>l



"##########################
" Plugin Manager
"##########################

"install
if has('vim_starting')
				set nocompatible
				if !isdirectory(expand("~/.vim/plugged/vim-plug"))
								echo "install plug..."
								:call system("mkdir -p ~/.vim/plugged/vim-plug")
								:call system("git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload")
				endif
				set runtimepath+=~/.vim/plugged/vim-plug
endif
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious'
call plug#end()



"#########################
" Denite Settings
"#########################
map <C-o>f :Denite file_rec<CR>
map <C-o>g :Denite -auto_preview grep<CR>
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])



"#########################
" Visual Settings
"#########################
let g:airline_theme='bubblegum'

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:･
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on
 
    " PODバグ対策
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction
 
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif



"#########################
" Highlight Settings
"#########################
autocmd BufNewFile,BufRead *.vue set filetype=html<Paste>
