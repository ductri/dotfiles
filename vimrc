" ----------------------------------
" Pluggins 
" ----------------------------------

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_log_ignore = ['Overfull']
  let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}

" Track the engine.
Plug 'sirver/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'preservim/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 

Plug 'tpope/vim-surround'

Plug 'benmills/vimux'
" Initialize plugin system
call plug#end()

" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})




" ----------------------------------
" OPTIONS AND VARIABLES
" ----------------------------------
set number
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
let g:tex_flavor = "latex" 
let DIARY='/home/tringuyen/research/notes/diary.md'
colorscheme gruvbox
set background=dark
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_ignore_filters = [
      \ "Font shape `U/stmry/b/n' undefined",
      \]

let mapleader = "-" 
let maplocalleader="\\"
" ----------------------------------
" KEY MAPPINGS
" ----------------------------------
nnoremap <f3> :NERDTreeToggle<cr>
inoremap jk <esc>

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr> 
nnoremap <leader>ed :split /home/tringuyen/research/notes/diary.md<cr>
nnoremap <leader>ne G3o<esc>i# New entry: <esc>"=strftime('%c')<C-M>p2o<esc>i
nnoremap <leader>c 0i%<esc>j
nnoremap <leader>j i<cr><esc>
" Thanks to https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

autocmd FileType matlab nnoremap <buffer> <f5> :call VimuxRunCommand(expand('%:t:r'))<cr>
autocmd FileType matlab nnoremap <buffer> <localleader>vl :VimuxRunLastCommand<CR>
autocmd FileType matlab nnoremap <buffer> <localleader>cd :call VimuxRunCommand("cd ".expand('%:p:h'))<cr>
autocmd FileType matlab nnoremap <buffer> <localleader>o :call VimuxRunCommand("matlab -nodesktop")<cr>
autocmd FileType matlab nnoremap <buffer> <localleader>c 0i%<esc>j

" ----------------------------------
" FUNCTIONS
" ----------------------------------
function! OpenMarkdownPreview() abort
  if exists('s:markdown_job') 
     call job_stop(s:markdown_job)
     unlet s:markdown_job
  endif
  echo expand('%:p')
  let s:markdown_job = job_start(["grip", expand('%:p')])
  sleep 300m
  call system('firefox http://localhost:6419')
endfunction

