
return {

  -- plugins/telescope.lua:
  { 'nvim-telescope/telescope.nvim', 
      tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }},
  
  -- Harpoon 
  { "nvim-lua/plenary.nvim" },
  {"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { {"nvim-lua/plenary.nvim"} }},

}
