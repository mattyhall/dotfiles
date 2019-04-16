""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin()
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours
set termguicolors
"if &term =~# '^tmux'
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
color dracula

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
let mapleader=" "
map <leader>p :Files<CR>
map <leader>f :Rg<CR>
map <leader>b :Buffers<CR>

nnoremap gf <c-i>
nnoremap gb <c-o>
nnoremap gt <c-]>

set number

" Comment
map <leader>/ gc

" Autocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_references()<CR>
map <leader>s :call LanguageClient#workspace_symbol()<CR>

" Fix for rg not working???
let g:airline#extensions#branch#enabled = 0

" Terminal mode escape
tnoremap <Esc> <C-\><C-n>

set mouse=a

" LSP
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run stable rustfmt'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <F2> :call CocAction("rename")<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
