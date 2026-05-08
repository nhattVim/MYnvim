return {
    "nvim-neotest/neotest",
    cmd = { "Neotest" },
    dependencies = {
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        { "rcasia/neotest-java", cmd = "NeotestJava" }
    },
    config = function()
        require("neotest").setup({
            adapters = { require("neotest-java")() },
            floating = { border = "rounded" },
        })
    end,
}
