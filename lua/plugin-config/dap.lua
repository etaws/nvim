local ok, dap = pcall(require, "dap")
if not ok then
    vim.notify("Could not load dap")
    return
end

local ok_dapui, dapui = pcall(require, "dapui")
if not ok_dapui then
    vim.notify("Could not load dapui")
    return
end

-- 💀 Adjust the path to your executable
local cmd = "/Users/xzhou/tools/codelldb/extension/adapter/codelldb"

dap.adapters.codelldb = function(on_adapter)
    -- This asks the system for a free port
    local tcp = vim.loop.new_tcp()
    tcp:bind("127.0.0.1", 0)
    local port = tcp:getsockname().port
    tcp:shutdown()
    tcp:close()

    -- Start codelldb with the port
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local opts = {
        stdio = { nil, stdout, stderr },
        args = { "--port", tostring(port) },
    }
    local handle
    local pid_or_err
    handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
        stdout:close()
        stderr:close()
        handle:close()
        if code ~= 0 then
            print("codelldb exited with code", code)
        end
    end)
    if not handle then
        vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
        stdout:close()
        stderr:close()
        return
    end
    vim.notify("codelldb started. pid=" .. pid_or_err)
    stderr:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            vim.schedule(function()
                require("dap.repl").append(chunk)
            end)
        end
    end)
    local adapter = {
        type = "server",
        host = "127.0.0.1",
        port = port,
    }
    -- 💀
    -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
    -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
    vim.defer_fn(function()
        on_adapter(adapter)
    end, 500)
end

dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = false,
    },
}

vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "Debug: Step out" })
vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })

require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
