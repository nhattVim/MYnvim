return {
    "nhattVim/check-deps.nvim",
    lazy = false,
    cmd = "DepsCheck",
    opts = {
        auto_check = true,
        list = {
            {
                name = "make",
                cmd = "make",
                install = {
                    linux = { "sudo apt install build-essential", "sudo pacman -S make" },
                    darwin = { "brew install make" },
                    windows = { "scoop install make", "choco install make" },
                },
            },
            {
                name = "node",
                cmd = "node",
                install = {
                    linux = { "sudo apt install nodejs" },
                    darwin = { "brew install node" },
                    windows = { "choco install nodejs", "scoop install nodejs" },
                },
            },
            {
                name = "unzip",
                cmd = "unzip",
                install = {
                    linux = { "sudo apt install unzip", "sudo pacman -S unzip" },
                    darwin = { "brew install unzip" },
                    windows = { "scoop install unzip", "choco install unzip" },
                },
            },
            {
                name = "curl",
                cmd = "curl",
                install = {
                    linux = { "sudo apt install curl", "sudo pacman -S curl" },
                    darwin = { "brew install curl" },
                    windows = { "scoop install curl", "winget install curl.curl" },
                },
            },
            {
                name = "python",
                cmd = "python3", -- Có thể đổi thành "python" tùy hệ thống của bạn
                install = {
                    linux = { "sudo apt install python3", "sudo pacman -S python" },
                    darwin = { "brew install python" },
                    windows = { "scoop install python", "winget install Python.Python.3" },
                },
            },
            {
                name = "node",
                cmd = "node",
                install = {
                    linux = { "sudo apt install nodejs npm", "sudo pacman -S nodejs npm" },
                    darwin = { "brew install node" },
                    windows = { "scoop install nodejs", "winget install OpenJS.NodeJS" },
                },
            },
            {
                name = "gcc (C Compiler)",
                cmd = "gcc",
                install = {
                    linux = { "sudo apt install gcc", "sudo pacman -S gcc" },
                    darwin = { "brew install gcc" },
                    windows = { "scoop install gcc", "choco install mingw" },
                },
            },
            -- Search Tools (Telescope dependencies)
            {
                name = "rg (ripgrep)",
                cmd = "rg",
                install = {
                    linux = { "sudo apt install ripgrep", "sudo pacman -S ripgrep" },
                    darwin = { "brew install ripgrep" },
                    windows = {
                        "scoop install ripgrep",
                        "choco install ripgrep",
                        "winget install BurntSushi.ripgrep.GNU",
                    },
                },
            },
            {
                name = "fd",
                cmd = "fd", -- Lưu ý: Trên Ubuntu/Debian có thể là "fdfind"
                install = {
                    linux = { "sudo apt install fd-find", "sudo pacman -S fd" },
                    darwin = { "brew install fd" },
                    windows = {
                        "scoop install fd",
                        "choco install fd",
                        "winget install sharkdp.fd",
                    },
                },
            },
            {
                name = "fzf",
                cmd = "fzf",
                install = {
                    linux = { "sudo apt install fzf", "sudo pacman -S fzf" },
                    darwin = { "brew install fzf" },
                    windows = {
                        "scoop install fzf",
                        "choco install fzf",
                        "winget install junegunn.fzf",
                    },
                },
            },
            -- Optional Tools
            {
                name = "lazygit",
                cmd = "lazygit",
                install = {
                    linux = {
                        "sudo add-apt-repository ppa:lazygit-team/release && sudo apt install lazygit",
                        "sudo pacman -S lazygit",
                    },
                    darwin = { "brew install lazygit" },
                    windows = {
                        "scoop install lazygit",
                        "choco install lazygit",
                        "winget install JesseDuffield.lazygit",
                    },
                },
            },
            {
                name = "translate-shell",
                cmd = "trans",
                install = {
                    linux = { "sudo apt install translate-shell", "sudo pacman -S translate-shell" },
                    darwin = { "brew install translate-shell" },
                },
            },
        },
    },
}
