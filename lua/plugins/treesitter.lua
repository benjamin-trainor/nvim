return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "help",
            "dockerfile",
            "git_config",
            "gitcommit",
            "git_rebase",
            "gitignore",
            "gitattributes",
        },
    },
    config = function()
        highlight = {
          enable = true
        }
    end
}
