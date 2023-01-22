local telescope = require("telescope")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            theme = "ivy",
            dir_icon = "",
            hidden = true,
            hide_parent_dir = true,
            hijack_netrw = true,
            layout_config = {
                height = 0.4
            },
            mappings = {
                ["i"] = {
                    ["<C-a>"] = fb_actions.create_from_prompt,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-e>"] = fb_actions.goto_parent_dir,
                    ["<C-b>"] = fb_actions.goto_cwd,
                },
                ["n"] = {
                },
            },
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown()
        }
    },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
