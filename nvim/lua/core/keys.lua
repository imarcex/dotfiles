local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Keybindings for nerdtree
map("n", "<C-t>", ":NERDTreeToggle<CR>")

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")
