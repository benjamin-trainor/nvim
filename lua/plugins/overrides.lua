return {
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "prettier", "js-debug-adapter" } },
    },
    -- added plugins
    {
        "tpope/vim-fugitive",
        options = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },
    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { "rafamadriz/friendly-snippets" },
            },
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                window = {
                    documentation = {
                        max_height = 100,
                        max_width = 100,
                    },
                },
                snippet = {
                    expand = function(item)
                        return LazyVim.cmp.expand(item.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "buffer" },
                    { name = "nvim_lsp", priority = 10 },
                    -- { name = "look" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "rg" },
                    --[[ { name = "calc" },
		            -- { name = "spell" }, ]]
                    -- { name = "emoji" },
                },
            })
        end,
        opts = function(_, opts)
            if LazyVim.has("nvim-snippets") then
                table.insert(opts.sources, { name = "snippets" })
            end
        end,
    },
    {
        "garymjr/nvim-snippets",
        opts = {
            friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "rafamadriz/friendly-snippets" },
}
