-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set('n', '<C-d>', 'mciw*<Cmd>nohl<CR>', { remap = true })