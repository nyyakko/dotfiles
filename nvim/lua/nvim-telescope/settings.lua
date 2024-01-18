local telescope = require('telescope')
local keymap = vim.keymap.set

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<esc>"] = require("telescope.actions").close }
        }
    }
})

telescope.load_extension("file_browser")

keymap("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true, noremap = true })
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<leader>fh", ":Telescope oldfiles<CR>", { silent = true })
keymap("n", "<leader>fk", ":Telescope buffers<CR>", { silent = true })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
keymap("n", "<leader>fG", ":lua require(\"telescope.builtin\").live_grep({search_dirs={vim.fn.expand(\"%:p\")}})<CR>", { silent = true })
