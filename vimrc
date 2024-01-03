if empty(glob('~/.vim/autoload/plug.vim'))"{{{}}}{{{}}}
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins ---------------------- {{{
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_log_ignore = ['Overfull']
    let g:vimtex_quickfix_ignore_filters = [
          \ 'Overfull',
          \]
    let g:vimtex_quickfix_enabled = 0
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_quickfix_open_on_warning = 0
    let g:tex_flavor = 'latex'
" Track the engine.
Plug 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plug 'raingo/vim-matlab'

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
    let g:gruvbox_italic=0
    let g:gruvbox_invert_selection=0
" Plug 'dracula/vim', { 'as': 'dracula' }
"
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'tpope/vim-surround'
Plug 'benmills/vimux'
    let g:VimuxUseNearest = 1

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
Plug 'gcmt/taboo.vim' 
Plug 'chrisbra/Colorizer'

" Plug 'Valloric/YouCompleteMe'
" let g:ycm_key_list_select_completion = ['<Down>']
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "ᐅ"
" set completeopt-=preview
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

Plug 'Chiel92/vim-autoformat'

Plug 'tomtom/tcomment_vim'

Plug 'francoiscabrol/ranger.vim'
let g:ranger_map_keys = 0

Plug 'jeetsukumaran/vim-markology'

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

Plug 'img-paste-devs/img-paste.vim'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
autocmd FileType markdown let g:PasteImageFunction = 'g:MyMarkdownPasteImage'
autocmd FileType markdown,tex nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'images'
let g:mdip_imgname = 'tmp_img'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
let g:mkdp_theme = 'light'
" Plug 'preservim/vim-markdown'

Plug 'godlygeek/tabular'

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
let VOCAB='/home/tringuyen/research/notes/math_vocab.md'
let TODOLIST='/home/tringuyen/research/notes/todo.md'
colorscheme gruvbox
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_ignore_filters = [
      \ "Font shape `U/stmry/b/n' undefined",
      \  "icml2019"
      \]
let mapleader = "-" 
let maplocalleader="\\"
set tags=tags
autocmd FileType matlab set tags+=/home/tringuyen/code/matlab/common/tags
set hlsearch
nohls
set pastetoggle=<F2>
set showmode
set laststatus=2
" Use system clipboard as default
set clipboard+=unnamedplus
set sessionoptions+=tabpages,globals " For Taboo plugin
let python_highlight_all=1
set scrolloff=5
set rnu
set nowrapscan
set ignorecase
set smartcase
autocmd FileType snippets setlocal foldmethod=marker
autocmd FileType python setlocal foldmethod=indent
autocmd FileType tex :normal! /begin{document}<cr>mB
au BufRead * normal zR
nnoremap * :keepjumps normal! mi*`i<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" For background transparent
hi Normal guibg=NONE ctermbg=NONE
autocmd FileType tex set spell spelllang=en_us
autocmd FileType text set spell spelllang=en_us
autocmd FileType markdown set spell spelllang=en_us
hi Folded ctermfg=102 guifg=#ccb878 guibg=NONE ctermbg=NONE
" #878787
set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let trim_sub = trim(sub)
  let ind = len(sub) - len(trim_sub)
  return sub[:ind-1] . '+-- ' . sub[ind:]
endfunction

hi clear SpellBad
hi SpellBad cterm=underline
" }}}


" Functions ---------------------- {{{

function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction

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
    " Credit to https://stackoverflow.com/questions/9033239/vim-regex-or-in-file-name-pattern-on-windows
    let list_pdfs = filter(split(globpath(dirpath, '**'), "\n"), 'v:val =~ ''\.\(\(png\)\|\(eps\)\)$''')
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

function! g:MyMarkdownPasteImage(relpath)
    execute 'normal! i<img src="' . a:relpath . '" width="800px">'
endfunction
" }}}


" Mappings ---------------------------------- {{{
nnoremap <f3> :NERDTreeToggle<cr>
inoremap jk <esc>

nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr> 
nnoremap <leader>eS :vsplit ~/.vim/UltiSnips/all.snippets<cr> 
nnoremap <leader>ed :tabnew /home/tringuyen/research/notes/diary.md<cr>
nnoremap <leader>el :tabnew /home/tringuyen/research/notes/todo.md<cr>
nnoremap <leader>emv :tabnew /home/tringuyen/research/notes/math_vocab.md<cr>
" Comment nnoremap <leader>ne G3o<esc>i# New entry: <esc>"=strftime('%c')<C-M>p2o<esc>i
nnoremap <leader>ne ggO# New entry: <esc>"=strftime('%c')<C-M>p2o<esc>i
" Comment
nnoremap <leader>j i<cr><esc>
" Thanks to https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>r :edit!<CR>

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

map <c-g> :Ranger<CR>

" New objects
vnoremap ip <esc>?left(<cr>Ewv/right)<cr>bbe
omap ip :normal vlp<cr>
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>


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
    autocmd FileType matlab set cc=80
    nnoremap <localleader>sd :let g:VimuxUseNearest=0<cr>:call VimuxOpenRunner()<cr>:VimuxRunCommand("./scripts/my_rsync/rsync_down.sh")<cr>:VimuxRunCommand("sleep 0.2")<cr>:VimuxRunCommand("exit")<cr>:let g:VimuxUseNearest=1<cr>
    nnoremap <localleader>su :let g:VimuxUseNearest=0<cr>:call VimuxOpenRunner()<cr>:VimuxRunCommand("./scripts/my_rsync/rsync_up.sh")<cr>:VimuxRunCommand("sleep 0.2")<cr>:VimuxRunCommand("exit")<cr>:let g:VimuxUseNearest=1<cr>
    nnoremap <localleader>sl :vs scripts/my_rsync/log<cr>
    autocmd FileType matlab nnoremap <buffer> <localleader>zz :vertical resize 80<cr>
    " }}}

    " PYTPHON {{{
    autocmd FileType python nnoremap <buffer> <localleader>vl :VimuxRunLastCommand<CR>
    autocmd FileType python nnoremap <buffer> <localleader>o :call VimuxRunCommand("python3")<cr>
    autocmd FileType python nnoremap <buffer> <f5> :call VimuxRunCommand("python3 '".expand('%:p')."'")<cr>
    autocmd FileType python vnoremap <buffer> <f6> :<c-u>call VimuxRunSelection()<cr>
    autocmd FileType python nnoremap <silent> <buffer> <f6> :call VimuxCurrentLine()<cr>
    autocmd FileType python set cc=80
    autocmd FileType python nnoremap <buffer> <localleader>zz :vertical resize 80<cr>
    " }}}

    " HASKELL {{{
    autocmd FileType haskell vnoremap <buffer> <f6> :<c-u>call VimuxRunSelection()<cr>
    " }}}

    " TEX {{{
    autocmd FileType tex nnoremap \\ :VimtexView<CR>
    autocmd FileType tex nnoremap <localleader>ww :!~/pyvenv/basic/bin/inkscape-figures watch<CR>
    " }}}

nnoremap <localleader>h :call ListEPSFiles()<cr>
" nnoremap <leader>zz : vertical resize<cr> :resize<cr>
nnoremap <silent> <leader>zz :tab split<CR> 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <cr> :nohlsearch<CR>
" vnoremap <cr> :nohlsearch<CR>

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

nnoremap <leader>fo :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ff :Rg<cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
noremap <leader>a <C-a>
noremap <leader>x <C-x>
noremap <leader>w :close<cr>
noremap <c-b> :ARsyncUp<cr>

inoremap <f7> <C-O>za
nnoremap <f7> za
onoremap <f7> <C-C>za
vnoremap <f7> zf
nnoremap <C-]> g<C-]>
nnoremap <localleader>cr :execute "cd " . project_root<cr>


" }}}


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal nofoldenable
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




