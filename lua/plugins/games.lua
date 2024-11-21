return {
    {
        "alec-gibson/nvim-tetris",
        cmd = "Tetris",
    },
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },
    {
        "seandewar/nvimesweeper",
        cmd = "Nvimesweeper",
    },
    {
        "NStefan002/speedtyper.nvim",
        cmd = "Speedtyper",
        opts = {},
    },
    {
        "Febri-i/snake.nvim",
        cmd = "SnakeStart",
        dependencies = {
            "Febri-i/fscreen.nvim",
        },
        opts = {},
    },
    {
        "jim-fx/sudoku.nvim",
        cmd = "Sudoku",
        opts = {},
    },
    {
        "seandewar/killersheep.nvim",
        cmd = "KillKillKill",
        opts = {
            gore = true,
            keymaps = {
                move_left = "h",
                move_right = "l",
                shoot = "<Space>",
            },
        },
    },
    {
        "letieu/hacker.nvim",
        cmd = {
            "Hack",
            "HackFollow",
            "HackAuto",
            "HackFollowAuto",
        },
        opts = {
            is_popup = true,
        },
    },
}
