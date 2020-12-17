if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins ---------------------- {{{
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
Plug 'raingo/vim-matlab'

let g:deoplete#enable_at_startup = 1
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=0
let g:gruvbox_invert_selection=0
Plug 'dracula/vim', { 'as': 'dracula' }
"
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'tpope/vim-surround'
Plug 'benmills/vimux'
    let g:VimuxUseNearest = 0
Plug 'christoomey/vim-tmux-navigator'
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
    " Always enable preview window on the right with 60% width
    let g:fzf_preview_window = 'right:60%'
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

Plug 'tpope/vim-obsession'
Plug 'kenn7/vim-arsync'
Plug 'gcmt/taboo.vim' 

" Initialize plugin system
call plug#end()
" }}}

" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Basic settings ---------------------------- {{{
set number
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set background=dark
set conceallevel=1
set autoindent
let g:tex_flavor = "latex" 
let DIARY='/home/tringuyen/research/notes/diary.md'
colorscheme gruvbox
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_ignore_filters = [
      \ "Font shape `U/stmry/b/n' undefined",
      \  "icml2019"
      \]
let mapleader = "-" 
let maplocalleader="\\"
set tags=tags
set hlsearch
set pastetoggle=<F2>
set showmode
set laststatus=2
" Use system clipboard as default
set clipboard=unnamedplus
set sessionoptions+=tabpages,globals " For Taboo plugin
" }}}


" Functions ---------------------- {{{
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

function! VimuxCurrentLine()
  let l:command = getline(".")
  call VimuxRunCommand(l:command.";")
endfunction

function! VimuxRunSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if line_start == line_end
        let lines[-1] = lines[-1][: column_end - 1]
        let lines[0] = lines[0][column_start - 1:]
    endif
    let l:command = join(lines, "\n")
    call VimuxRunCommand(l:command.";")
endfunction

function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 2]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! ListEPSFiles()
    call inputsave()
    let dirpath = input('Enter relative path to directory: ')
    call inputrestore()
    if dirpath == ""
        return
    endif
    let list_pdfs = split(globpath(dirpath, '*.eps'), "\n")
    let output = ["\\begin{figure}[H] \n"] 
    let index = 0
    for item in list_pdfs
        let file_name = join(split(split(item, '/')[-1], '\.')[:-2], '.')
        let new_item=printf("\\begin{subfigure}[t]{0.45\\textwidth}\n\\includegraphics[width=\\textwidth]{%s}\n\\caption{%s}\n\\end{subfigure}\n",item,file_name)
        if index %2 ==1
            let new_item = new_item . "\n"
        endif
        call add(output, new_item)
        let index += 1
    endfor
    call add(output, "\\end{figure}" )
    let output = join(output, "")
    execute ':normal! O' . output
"    $put=output
endfunction
" }}}


" Mappings ---------------------------------- {{{
nnoremap <f3> :NERDTreeToggle<cr>
inoremap jk <esc>

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr> 
nnoremap <leader>eS :vsplit ~/.vim/UltiSnips/all.snippets<cr> 
nnoremap <leader>ed :split /home/tringuyen/research/notes/diary.md<cr>
nnoremap <leader>ne G3o<esc>i# New entry: <esc>"=strftime('%c')<C-M>p2o<esc>i
" Comment
nnoremap <leader>c ^i% <esc>j 
nnoremap <leader>j i<cr><esc>
" Thanks to https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>r :edit!<CR>

    " MATLAB {{{
    autocmd FileType matlab nnoremap <buffer> <f5> :call VimuxRunCommand(expand('%:t:r'))<cr>
    " autocmd FileType matlab nnoremap <buffer> <c-w><F5> :call VimuxRunCommand('dbstop if error; '.expand('%:t:r'))<cr>

    autocmd FileType matlab nnoremap <buffer> <f7>:call VimuxRunCommand(expand('%:t:r').'; !notify-send Matlab "It is done"' )<cr>
    "noremap <f7> :call VimuxRunCommand(expand('%:t:r').'; !notify-send Matlab "It is done"' )<cr>
    autocmd FileType matlab nnoremap <silent> <buffer> <f6> :call VimuxCurrentLine()<cr>
    autocmd FileType matlab vnoremap <buffer> <f6> :<c-u>call VimuxRunSelection()<cr>
    autocmd FileType matlab nnoremap <buffer> <localleader>vl :VimuxRunLastCommand<CR>
    " Close vim tmux runner opened by VimuxRunCommand
    autocmd FileType matlab nnoremap <buffer> <localleader>vq :VimuxCloseRunner<CR>
    autocmd FileType matlab nnoremap <buffer> <localleader>cd :call VimuxRunCommand("cd ".expand('%:p:h'))<cr>
    autocmd FileType matlab nnoremap <buffer> <f9> :call VimuxRunCommand("dbstop in ".expand('%')." at ".line("."))<cr>
    autocmd FileType matlab nnoremap <buffer> <f10> :call VimuxRunCommand("dbclear all")<cr>
    autocmd FileType matlab nnoremap <buffer> <localleader>o :call VimuxRunCommand("matlab -nodesktop")<cr>
    autocmd FileType matlab nnoremap <buffer> <localleader>c 0i%<esc>j
    autocmd FileType matlab set cc=80
    autocmd FileType matlab nnoremap <buffer> <localleader>sd :ARsyncDown<cr>:copen<cr><c-w>k
    autocmd FileType matlab nnoremap <buffer> <localleader>su :ARsyncUp<cr>:copen<cr><c-w>k
    autocmd FileType matlab nnoremap <buffer> <localleader>zz :vertical resize 80<cr>
    " }}}


    " PYTPHON {{{
    autocmd FileType python nnoremap <buffer> <localleader>vl :VimuxRunLastCommand<CR>
    autocmd FileType python nnoremap <buffer> <localleader>o :call VimuxRunCommand("python3")<cr>
    autocmd FileType python nnoremap <buffer> <f5> :call VimuxRunCommand("exec(open('".expand('%:p')."').read())")<cr>
    autocmd FileType python vnoremap <buffer> <f6> :<c-u>call VimuxRunSelection()<cr>
    autocmd FileType python nnoremap <silent> <buffer> <f6> :call VimuxCurrentLine()<cr>
    " }}}


nnoremap <localleader>h :call ListEPSFiles()<cr>
" nnoremap <leader>zz : vertical resize<cr> :resize<cr>
nnoremap <silent> <leader>zz :tab split<CR> 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <cr> :nohlsearch<CR>

nnoremap <F2> :set invpaste paste?<CR>

" Run ctags
nnoremap <leader>rt :!ctags -R .<cr><cr>

" Go down 5 lines
noremap gj 5j

" Go up 5 lines
noremap gk 5k

" Reload UtilSnip
nnoremap <leader>rs :call UltiSnips#RefreshSnippets()<cr>

" Centering the hitting search
nnoremap n nzz

" Count search
nnoremap <f4> :%s///gn<cr>

nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Rg<cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
noremap <leader>a <C-a>
noremap <leader>x <C-x>
noremap <leader>w :close<cr>
" noremap <c-g> :silent exec "!gnome-terminal -e ranger"<cr>
noremap <c-b> :ARsyncUp<cr>

inoremap <f7> <C-O>za
nnoremap <f7> za
onoremap <f7> <C-C>za
vnoremap <f7> zf
nnoremap <C-]> g<C-]>
" }}}


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" Miscellacious -------------------- {{{
" 
if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
endif
set incsearch
" }}}



