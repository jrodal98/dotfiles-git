" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" minimal.vim settings
Plug 'metalelf0/supertab'
Plug 'justinmk/vim-sneak'
Plug 'svermeulen/vim-cutlass'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'chaoren/vim-wordmotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'Yggdroot/indentLine'

" Complete (ide and visual experience) settings
if !exists('g:vscode')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jalvesaq/Nvim-R'
    Plug 'rust-lang/rust.vim'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'joshdick/onedark.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'chriskempson/base16-vim'
    Plug 'dense-analysis/ale'
    Plug 'Chiel92/vim-autoformat'
    Plug 'honza/vim-snippets'
    Plug '2072/PHP-Indenting-for-VIm'
    Plug 'luochen1990/rainbow'
endif
call plug#end()


" for settings in the minimal plugins
exec 'source' '~/.config/nvim/minimal.vim'
" for settings that are plugin agnostic
exec 'source' '~/.config/nvim/general.vim'

if !exists('g:vscode')
    " for settings in the complete plugins
    exec 'source' '~/.config/nvim/complete.vim'
    exec 'source' '~/.config/nvim/coc.vim'
endif
