-- bootstrap lazy.nvim, LazyVim and your plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}, {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {}
}, {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    cond = not not vim.g.vscode,
    opts = {}
}})

-- vim.keymap.set({"n", "x", "i"}, "<C-d>", function()
--     require("vscode-multi-cursor").addSelectionToNextFindMatch()
-- end)

-- Create a multicursor in current word and jump to next occurrence
vim.keymap.set('n', 'gb', 'mciw*<Cmd>nohl<CR>', {
    remap = true
})

-- Create a multicursor of current selection and select next occurrence
vim.keymap.set('v', 'gb', 'ygvmc/\\V<C-R>"<CR>', {
    remap = true
})