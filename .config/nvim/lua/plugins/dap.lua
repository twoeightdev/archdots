return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = { highlight_new_as_changed = true },
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                dependencies = "williamboman/mason.nvim",
                opts = {
                    automatic_installation = true,
                    handlers = {},
                    ensure_installed = { "python" },
                },
            },
            {
                "ofirgall/goto-breakpoints.nvim",
                keys = {
                    {
                        "]b",
                        function()
                            return require("goto-breakpoints").next()
                        end,
                        desc = "Next breakpoint",
                    },
                    {
                        "[b",
                        function()
                            return require("goto-breakpoints").prev()
                        end,
                    },
                },
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = "nvim-neotest/nvim-nio",
                keys = {
                    {
                        "<leader>du",
                        function()
                            return require("dapui").toggle()
                        end,
                        desc = "Dap UI",
                    },
                    {
                        "<leader>de",
                        function()
                            return require("dapui").eval()
                        end,
                        desc = "Eval",
                        mode = { "n", "v" },
                    },
                },
                config = function()
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup({
                        icons = {
                            expanded = "▾",
                            collapsed = "▸",
                        },
                        layouts = {
                            {
                                elements = {
                                    {
                                        id = "scopes",
                                        size = 0.15,
                                    },
                                    "breakpoints",
                                    "stacks",
                                    "watches",
                                },
                                size = 40,
                                position = "left",
                            },
                            {
                                elements = { "repl", "console" },
                                size = 13,
                                position = "bottom",
                            },
                        },
                    })
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        -- dapui.close()
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        -- dapui.close()
                    end
                end,
            },
            {
                "mfussenegger/nvim-dap-python",
                dependencies = {
                    "mfussenegger/nvim-dap",
                    "rcarriga/nvim-dap-ui",
                },
                ft = "python",
                config = function()
                    local dap_python = require("dap-python")
                    -- dap_python.setup("~/.venv/devtool/bin/python")
                    dap_python.setup("/usr/bin/python")
                end,
            },
        },
        keys = {
            {
                "<leader>dB",
                function()
                    return require("dap").set_breakpoint(
                        vim.fn.input("Breakpoint condition: ")
                    )
                end,
                desc = "Breakpoint Condition",
            },
            {
                "<leader>db",
                function()
                    return require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dc",
                function()
                    return require("dap").continue()
                end,
                desc = "Continue",
            },
            {
                "<leader>dC",
                function()
                    return require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },
            {
                "<leader>dg",
                function()
                    return require("dap").goto_()
                end,
                desc = "Go to line (no execute)",
            },
            {
                "<leader>di",
                function()
                    return require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                "<leader>dj",
                function()
                    return require("dap").down()
                end,
                desc = "Down",
            },
            {
                "<leader>dk",
                function()
                    return require("dap").up()
                end,
                desc = "Up",
            },
            {
                "<leader>dl",
                function()
                    return require("dap").run_last()
                end,
                desc = "Run Last",
            },
            {
                "<leader>dO",
                function()
                    return require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>do",
                function()
                    return require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                "<leader>dp",
                function()
                    return require("dap").pause()
                end,
                desc = "Pause",
            },
            {
                "<leader>dr",
                function()
                    return require("dap").repl.toggle()
                end,
                desc = "Toggle REPL",
            },
            {
                "<leader>ds",
                function()
                    return require("dap").session()
                end,
                desc = "Session",
            },
            {
                "<leader>dt",
                function()
                    return require("dap").terminate()
                end,
                desc = "Terminate",
            },
            {
                "<leader>dw",
                function()
                    return require("dap.ui.widgets").hover()
                end,
                desc = "Widgets",
            },
        },
        config = function()
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
        end,
    },
}
