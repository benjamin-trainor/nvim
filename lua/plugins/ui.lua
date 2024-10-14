return {
    -- {{{ lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        cmd = {},
        event = {},
        ft = {},
        keys = {},
        opts = function(_, opts)
            if true == true then
                opts.options = {
                    icons_enabled = true,
                    theme = "auto",
                    -- theme = "seoul256",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                }

                opts.sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    -- 0 = just filename, 1 = relative path, 2 = absolute path
                    lualine_c = { { "filename", path = 1 }, require("pomodoro").statusline },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                }

                opts.inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                }

                opts.tabline = {}
                opts.winbar = {}
                opts.inactive_winbar = {}
                opts.extentions = {}
            else
                -- Use default LazyVim setup.
                opts = {}
            end
        end,
        dependencies = { "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    },
    --    {
    --        -- name of plugin,
    --        cmd = {},
    --        event = {},
    --        ft = {},
    --        keys = {},
    --        opts = {},
    --        dependencies = {},
    --    },
}
