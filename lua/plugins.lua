require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself
  -- Auto Pairs
  'jiangmiao/auto-pairs' ;
  -- Color scheme
   'overcache/NeoSolarized'; 
  -- Fuzzy finder
   'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
   {'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}};

  -- File explorer with icons 
   'kyazdani42/nvim-tree.lua';
  -- Auto Completion and vsnip snippets
    'hrsh7th/nvim-compe';
    'hrsh7th/vim-vsnip';
    'hrsh7th/vim-vsnip-integ';
  -- flutter tools
  {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'};
  --dart syntax highlight and formatting
   'dart-lang/dart-vim-plugin';
   --  lsp plugin based on neovim built-in lsp
   'glepnir/lspsaga.nvim';
   -- vim-ripgrep
   'jremmen/vim-ripgrep';
   -- For markdown
   'godlygeek/tabular';
   'plasticboy/vim-markdown';
   'iamcco/markdown-preview.nvim';
  -- for auto dir creation
   'pbrisbin/vim-mkdir';
  -- Surround plugin
  'tpope/vim-surround';
}


