-- setup with all defaults

-- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_respect_buf_cwd = 0

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
    folder_arrows = 0,
}

require("nvim-tree").setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "right",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            git = false,
            profile = false,
        },
    },
})

-- nvimTree keymap
-- vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
