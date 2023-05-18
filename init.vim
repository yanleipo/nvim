set clipboard+=unnamedplus

set nocompatible                                                                                                                                                                              
set ruler                                                                                                                                                                                     
set showmatch                                                                                                                                                                                 
set hlsearch                                                                                                                                                                                  
set ignorecase                                                                                                                                                                                
set incsearch                                                                                                                                                                                 
colorscheme elflord
set termguicolors

" Change .h header filetype to c instead of cpp
au BufRead,BufNewFile *.h set ft=c

set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=grey

set list
set listchars=tab:>-

" Treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'folke/which-key.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'kkharji/sqlite.lua'
Plug 'AckslD/nvim-neoclip.lua'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('/local/lyan/lgm/gutentags/tags')
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" disable default keymaps
let g:gutentags_plus_nomap = 1

Plug 'yanleipo/vim-preview'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:c_checker_checkpatch_location = "/home/lyan/bin/"
let g:syntastic_c_check_header = 1
let g:syntastic_c_checkers = []
" Uncomment below low to enable checkpatch
" let g:syntastic_c_checkers = ['checkpatch']

Plug 'azabiong/vim-highlighter'
let HiFindTool = 'rg -H --color=never --no-heading --column --smart-case'

" Status line
Plug 'preservim/tagbar'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#whitespace#mixed_indent_algo = 2

Plug 'nvim-tree/nvim-web-devicons'
Plug 'sindrets/diffview.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'semanticart/tag-peek.vim'
function! MyFloatConfig()
  return {
        \ 'relative': 'editor',
        \ 'row': 0,
        \ 'col': 100,
        \ 'width': 100,
        \ 'height': 60,
        \ 'border': 'single'
        \ }
endfunction
let g:tag_peek_float_config="MyFloatConfig"

Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 0

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" change the leader key from "\" to " " ("," is also popular)
let mapleader=" "

" lua require('telescope').load_extension('neoclip')
lua require('config/neoclip')

lua require('config/mason')
lua require('config/mason-lspconfig')
lua require('config/nvim-lspconfig')
lua require('config/nvim-treesitter')
lua require('config/telescope')
lua require('config/diffview')
lua require('config/which-key')
lua require('config/toggleterm')


" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" keymap for PreviewTag
noremap <F4> :PreviewTag<cr>
noremap <F3> :PreviewTagPrev<cr>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>

" keymap for Highlighter
noremap .  :Hi > <cr>
noremap ,  :Hi < <cr>
noremap > :Hi } <cr>
noremap < :Hi { <cr>
noremap <F5>  :Hi save<cr>
noremap <F6>  :Hi load<cr>

" keymap for gutentags_plus
noremap  <leader>cs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>cg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>cc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>ct :GscopeFind t <C-R><C-W><cr>

" Keymap for diffview
noremap <leader>do :DiffviewOpen<cr>
noremap <leader>dc :DiffviewClose<cr>
noremap <leader>dh :DiffviewFileHistory % -n20<cr>

" Keymap for neoclip
" noremap <leader>c :lua require('telescope').extensions.neoclip.default()<cr>
noremap <leader>c :Telescope neoclip<cr>

" Keymap for which-key
noremap <F2> :WhichKey<cr>

" Keymap for telescope
" noremap <leader><space> :Telescope buffers<cr>
noremap <leader><space> :Telescope find_files no_ignore=true hidden=true<cr>
noremap <leader>fb :Telescope buffers<cr>
noremap <leader>ff :Telescope find_files no_ignore=true hidden=true<cr>
noremap <leader>fg :Telescope live_grep<cr>
noremap <leader>fh :Telescope help_tags<cr>
noremap <leader>fw :Telescope grep_string<cr>
noremap <leader>fo :Telescope oldfiles<cr>
noremap <leader>gc :Telescope git_commits<cr>
noremap <leader>gs :Telescope git_status<cr>
noremap <leader>gb :Telescope git_branch<cr>
noremap <leader>fs :Telescope treesitter<cr>
noremap <leader>fc :Telescope builtin<cr>
noremap <leader>fz :Telescope zoxide list<cr>
noremap <leader>fd :Telescope file_browser hidden=true<cr>

" Keymap for ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Keymap for tag-peek
nnoremap <leader>q :call tag_peek#ShowTag()<CR>

" Keymap for blamer
noremap <F9> :BlamerToggle<cr>

