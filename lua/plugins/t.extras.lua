return {
    {
        "aurum77/live-server.nvim",
        build = ":LiveServerInstall",
        cmd = "LiveServer",
    },
    {
        "nhattVim/projects.nvim",
        cmd = {
            "ProjectList",
            "ProjectAdd",
            "ProjectRemove",
        },
        opt = {},
    },
}
