return {
    "nvim-neotest/neotest",
    cmd = { "Neotest" },
    dependencies = {
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        { "rcasia/neotest-java", build = ":NeotestJava setup" },
    },
    config = function()
        require("neotest").setup({
            adapters = { require("neotest-java")() },
            floating = { border = "rounded" },
        })
    end,
}
