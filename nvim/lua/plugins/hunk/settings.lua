local hunk = require("hunk")

hunk.setup({
    keys = {
        global = {
            quit = { "q" },
            accept = { "<leader><Cr>" },
            focus_tree = { "<leader>e" },
        },

        tree = {
            expand_node = { "l", "<Right>" },
            collapse_node = { "h", "<Left>" },

            open_file = { "<Cr>" },

            toggle_file = { "a" },
        },

        diff = {
            toggle_line = { "a" },
            toggle_hunk = { "A" },
        },
    },

    ui = {
        tree = {
            mode = "nested",
            width = 35,
        },
        layout = "vertical",
    },

    icons = {
        selected = "󰡖",
        deselected = "",
        partially_selected = "󰛲",

        folder_open = "",
        folder_closed = "",
    },
})
