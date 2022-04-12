require('lint').linters_by_ft = {
    markdown = {'markdownlint',}
}

vim.cmd([[
au BufEnter * lua require('lint').try_lint()
au BufWritePost * lua require('lint').try_lint()
]])
