local colorscheme = "zephyr"
-- onebuddy 
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox 

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    return
end

vim.g.vscode_style = "light"
vim.g.vscode_disable_nvimtree_bg = true

