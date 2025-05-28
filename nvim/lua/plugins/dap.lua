return {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
            "nvim-neotest/nvim-nio",
            "leoluz/nvim-dap-go",
            "mfussenegger/nvim-dap-python",
            "julianolf/nvim-dap-lldb",
    },
}
