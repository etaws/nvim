local markdownlint = require("lint.linters.markdownlint")
markdownlint.args = {
    "--config=/Users/xzhou/.config/markdownlint/.markdownlint.json",
}

require("lint").linters_by_ft = {
    markdown = { "markdownlint" },
    cpp = { "cppcheck", "clangtidy" },
    cmake = { "cmakelint" },
}

vim.cmd([[
au BufEnter * lua require('lint').try_lint()
au BufWritePost * lua require('lint').try_lint()
]])
