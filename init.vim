" ============= Vim-Plug ============== "{{{

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= looks and GUI stuff ================== "{{{

Plug 'vim-airline/vim-airline'                          " airline status bar
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'luochen1990/rainbow'                              " rainbow parenthesis
Plug 'hzchirs/vim-material'                             " material color themes
"}}}

" ================= Functionalities ================= "{{{

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
  Plug 'junegunn/fzf.vim'                               " fuzzy search integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more

  Plug 'antoinemadec/coc-fzf'                           " 'replaces' coc list with fzf
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'mhinz/vim-startify'                               " cool start up screen
" Plug 'tpope/vim-fugitive'                               " git support
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'wellle/tmux-complete.vim'                         " complete words from a tmux panes
Plug 'christoomey/vim-tmux-navigator'                   " seamless vim and tmux navigation
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'machakann/vim-sandwich'                           " make sandwiches
Plug 'folke/which-key.nvim'                             " display keybinds as you type them
"tests
Plug 'vim-test/vim-test'
"js-jsx-ts-tsx
Plug 'pangloss/vim-javascript' , {'for': ['javascript', 'javascriptreact']}
Plug 'leafgarland/typescript-vim' , {'for': ['typescript', 'typescriptreact']}
Plug 'maxmellon/vim-jsx-pretty' , {'for': ['javascriptreact', 'typescriptreact']} "jsx highlighting
"tex
Plug 'lervag/vimtex', {'for': 'tex'}                    " vimtex
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}    " tex conceal

call plug#end()

"}}}

" ==================== general config ======================== "{{{

set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=90                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldmethod=syntax                                   " fold according to syntax highlight
set foldlevel=99                                        " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
set grepprg=rg\ --vimgrep                               " use rg as default grepper

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=0

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

"turn off backups (we have git and other vcs anyways)
set nobackup
set nowb
set noswapfile

" Themeing
let g:material_style = 'oceanic'
set background=dark
colorscheme vim-material
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

"comment color
hi Comment guifg=#86a883
"fold color
hi Folded guifg=#86a883
"conceal color same as normal
hi Conceal guifg=Normal
"for coc-nvim same symbol highlight
hi CursorColumn guifg=white

"}}}

" ======================== Plugin Configurations ======================== "{{{

"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = expand('/usr/bin/python3')

" Airline
let g:airline_theme='material'
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.dirty= ''

"" coc

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-eslint',
            \'coc-prettier',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-texlab',
            \'coc-vimtex',
            \]

" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

"" startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim/init.vim'},
    \ {'coc': '~/.config/nvim/coc-settings.json'},
    \ {'al': '~/.zsh_aliases'},
    \ {'term': '/mnt/c/Users/chris/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'}
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" custom banner
let g:startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]

" rainbow brackets
let g:rainbow_active = 1

" tmux navigator
let g:tmux_navigator_no_mappings = 1

" FZF
let g:fzf_action = {
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
  " \ 'ctrl-t': 'tab split',

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --bind=ctrl-t:down,ctrl-s:up'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

" coc-fzf
let g:coc_fzf_preview = ''                              " do not overwrite fzf_layout
let g:coc_fzf_opts = []

" tex-conceal
let g:tex_conceal = 'abdgm'

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

" vim-smoothie
let g:smoothie_no_default_mappings = 1

" vim-test
let test#strategy = "neovim"

"}}}

" ======================== Commands ============================= "{{{

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif


" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" startify if no passed argument or all buffers are closed
augroup noargs
    " startify when there is no open buffer left
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
    " autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

"}}}

" ================== Custom Functions ===================== "{{{

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"}}}

" ======================== Custom Mappings ====================== "{{{
"keyboard layout remaps
noremap t j
noremap s k
noremap n l

noremap j t
noremap k s
noremap l n

"" the essentials
let mapleader=","
nmap \ <leader>q
map <F6> :Startify <CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
map <leader>fo :Format<CR>
nmap <C-w> :bnext<CR>
nmap <C-d> :bprevious<CR>
noremap <leader>e :PlugInstall<CR>
noremap <C-q> :q<CR>
" renaming
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf :CocCommand workspace.renameCurrentFile<CR>

" new line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-t> <C-\><C-N><C-w>j
inoremap <C-s> <C-\><C-N><C-w>k
inoremap <C-n> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-t> <C-w>j
nnoremap <C-s> <C-w>k
nnoremap <C-n> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" FZF
noremap <leader>/ :Rg<CR>
noremap <leader>lf :Files<CR>
noremap <leader>lb :Buffers<CR>
noremap <leader>lt :BTags<CR>
noremap <leader>lh :History/<CR>
noremap <leader>gc :Commits<CR>
noremap <leader>gs :GFiles?<CR>
" coc-fzf
noremap <leader>lo :CocFzfList outline<CR>
noremap <leader>lc :CocFzfList commands<CR>
noremap <leader>ly :CocFzfList yank<CR>
noremap <leader>ld :CocFzfList diagnostics --jurrent-buf<CR>
noremap <leader>ls :CocFzfList snippets<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

"" coc

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? coc#_select_confirm() :
	  \ coc#expandableOrJumpable() ?
	  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
nnoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" multi cursor shortcuts
nmap <silent> <C-a> <Plug>(coc-cursors-word)
xmap <silent> <C-a> <Plug>(coc-cursors-range)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" other stuff
nmap <leader>o :OR <CR>

" jump stuff
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)

" other coc actions
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>a <Plug>(coc-codeaction-cursor)
xmap <leader>a <Plug>(coc-codeaction-selected)

" fugitive mappings
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Gblame<CR>

" tmux navigator
" nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <M-t> :TmuxNavigateDown<cr>
" nnoremap <silent> <M-s> :TmuxNavigateUp<cr>
" nnoremap <silent> <M-n> :TmuxNavigateRight<cr>

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>


"sandwich remap
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1


silent! nmap <unique> Sa <Plug>(operator-sandwich-add)
silent! xmap <unique> Sa <Plug>(operator-sandwich-add)
silent! omap <unique> Sa <Plug>(operator-sandwich-g@)

silent! nmap <unique><silent> Sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> Sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> Sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> Srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

"so substitute line does not work
map S <Nop>

" Smoothie
nmap <C-t> <Plug>(SmoothieDownwards)
nmap <C-s> <Plug>(SmoothieUpwards)
nmap gg <Plug>(Smoothie_gg)
nmap G <Plug>(Smoothie_G)

" ---------------------- FileType specific mappings ----------------------------

" coc-texlab
autocmd FileType tex nnoremap <leader>bf :CocCommand latex.Build<CR>

" markdown preview
autocmd FileType markdown nmap <leader>m :MarkdownPreview<CR>

"}}}

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
