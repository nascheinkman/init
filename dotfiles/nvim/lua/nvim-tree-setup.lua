require("nvim-tree").setup({
    disable_netrw = true,
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                default = "🗏",
                symlink = "↦",
                modified = "●",
                folder = {
                    arrow_closed = "▶",
                    arrow_open = "▼",
                    default = "🖿",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "↔️🖿",
                    symlink_open = "↔️",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "⟽",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "🗑",
                    ignored = "◌",
                },
            },
        },
    },
})

