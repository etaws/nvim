local ok, _ = pcall(require, "stylua")
if not ok then
    vim.notify("Could not load stylua")
    return
end

vim.api.nvim_set_keymap("n", "cf", "<cmd>lua require('stylua').format()<CR>", { noremap = true, silent = true })
