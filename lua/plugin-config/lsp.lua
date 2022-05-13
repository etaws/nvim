local nvim_lsp = require("lspconfig")

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", opts)
    -- map(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- goto preview keymappigs
    -- map(bufnr, "n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    -- map(bufnr, "n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",opts)
    -- map(bufnr, "n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
    -- map(bufnr, "n", "gf", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- clangd setup
nvim_lsp["clangd"].setup({
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--completion-style=bundled",
        "--header-insertion=iwyu",
    },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
})

-- sumneko_lua location
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
nvim_lsp["sumneko_lua"].setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = runtime_path },
            diagnostics = { globals = { "vim", "use", "packer_plugins" } },
            telemetry = { enable = false },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
    },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
})

-- cmake setup
nvim_lsp["cmake"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
})

-- rust_analyzer setup
nvim_lsp["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
})
