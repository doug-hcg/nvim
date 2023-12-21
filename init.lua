vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
}
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
require("catppuccin").setup()

local builtin = require('telescope.builtin')
local config = require("nvim-treesitter.configs")

config.setup({
    ensure_installed = {
        "lua", "javascript", "java", "python", "dockerfile", "bash", "comment", "css", "csv", "diff", 
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "gomod", "graphql",
        "groovy", "html", "json", "r", "rust", "scss", "sql", "ssh_config", "typescript", "vim", "xml",
        "yaml"
    },
    highlight = { enable = true },
    indent = { enable = true }
})

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<cr>')
vim.keymap.set('n', '<C-m>', ':Neotree filesystem close<cr>')

vim.cmd.colorscheme "catppuccin"

