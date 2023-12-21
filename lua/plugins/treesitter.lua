return {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function()
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
        end
}
