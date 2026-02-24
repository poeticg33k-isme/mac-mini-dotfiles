set nocompatible

" --- UI and Search ---
syntax on
set hlsearch
set incsearch
set laststatus=2
set noshowmode " Hide '-- INSERT --' because we'll use a status line later

" The 'Clean Screen' mapping
nnoremap <esc> :noh<return><esc>
set clipboard=unnamedplus


" Copy entire file to clipboard without trailing spaces
nnoremap <leader>y :%yank +<CR>

" --- The Number Logic Explained ---
"set number         " Shows the actual line number of the current line.
"set relativenumber " Shows how many lines away other lines are (useful for jumping).
" WHY USE BOTH? In modern Vim, this gives you 'Hybrid' numbers.
" The current line shows its real ID (e.g., 42), but others show 1, 2, 3.
" To delete 5 lines down, you just see the '5' and type 'd5j'. No math needed!

" --- Backspace and Indenting ---
set backspace=indent,eol,start
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" --- Everforest Colorscheme Configuration ---
if has('termguicolors')
  set termguicolors
endif

" Available: 'hard', 'medium' (default), 'soft'
let g:everforest_background = 'medium'
let g:everforest_enable_italic = 1

set background=dark
colorscheme everforest

" --- Folding and Toggles ---
set foldmethod=manual
set pastetoggle=<F2>
let &t_ut=''

" --- The 'No-Numbers' Copy Hack ---
" Pressing F3 toggles ALL numbers off so you can click-and-drag with your mouse
" to copy text without grabbing the line numbers.
" Updated Toggle
nnoremap <F3> :set invnumber invrelativenumber<CR>:let &t_ut = (&t_ut == '' ? 'y' : '')<CR>

" --- Performance ---
set ttyfast
"set lazyredraw
"
autocmd BufWritePre * %s/\s\+$//e

" --- Keyboard Shortcuts ---

" CTRL-A: Select All
" (In Vim: Go to top, start Visual mode, go to bottom)
nnoremap <C-a> ggVG

" CTRL-C: Copy Selection (in Visual Mode)
" This sends the highlight to the '+' register (System Clipboard)
vnoremap <C-c> "+y

" CTRL-V: Paste from System Clipboard (in Normal Mode)
nnoremap <C-v> "+p

" CTRL-V: Paste while in Insert Mode (like a normal text editor)
inoremap <C-v> <C-r>+

" 1. Link Vim's yank/delete to the system clipboard
set clipboard=unnamedplus

" 2. The 'Copy Entire File' shortcut we discussed
" This clears trailing spaces AND yanks the whole document
nnoremap <leader>y :%s/\s\+$//e<CR>:%yank +<CR>

" 3. Visual Block Mode shortcut
" Sometimes Ctrl+v is swallowed by the terminal.
" This maps it to 'vv' just in case.
nnoremap vv <C-v>

