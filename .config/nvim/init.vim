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
    Plug 'rust-lang/rust.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'nvim-lua/completion-nvim'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree'
    Plug 'godlygeek/tabular'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
    " Plug 'dense-analysis/ale'
    Plug 'Chiel92/vim-autoformat'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'luochen1990/rainbow'
endif
call plug#end()


source ~/.config/nvim/general.vim

source ~/.config/nvim/plug-config/cutlass.vim
source ~/.config/nvim/plug-config/supertab.vim

if !exists('g:vscode')
    source ~/.config/nvim/plug-config/startify.vim
    source ~/.config/nvim/plug-config/nerdtree.vim
    source ~/.config/nvim/plug-config/airline.vim
    source ~/.config/nvim/plug-config/vim-markdown.vim
    source ~/.config/nvim/plug-config/markdown-preview.vim
    source ~/.config/nvim/plug-config/rainbow.vim
    source ~/.config/nvim/plug-config/vim-autoformat.vim
    source ~/.config/nvim/plug-config/onedark.vim
    source ~/.config/nvim/plug-config/ultisnips.vim
    source ~/.config/nvim/plug-config/completion-nvim.vim

    luafile ~/.config/nvim/lua/lsp/lsp-config.lua
    luafile ~/.config/nvim/lua/plug-config/tree-sitter-config.lua
endif

