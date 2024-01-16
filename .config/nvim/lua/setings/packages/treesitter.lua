require'nvim-treesitter.configs'.setup {

  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Setarea plierii codului 

vim.cmd([[ 
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable    " Disable folding at startup.
]])

