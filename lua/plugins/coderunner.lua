local temp = vim.fn.stdpath("cache") .. "/out"
vim.fn.mkdir(temp, "p")

return {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject" },
    opts = {
        filetype = {
            cpp = string.format(
                "cd $dir && g++ $fileName -o '%s/$fileNameWithoutExt' && '%s/$fileNameWithoutExt'",
                temp,
                temp
            ),
            c = string.format(
                "cd $dir && gcc $fileName -o '%s/$fileNameWithoutExt' && '%s/$fileNameWithoutExt'",
                temp,
                temp
            ),
            rust = string.format(
                "cd $dir && rustc $fileName -o '%s/$fileNameWithoutExt' && '%s/$fileNameWithoutExt'",
                temp,
                temp
            ),
            java = string.format(
                "cd $dir && javac -d '%s' $fileName && cd '%s' && java $fileNameWithoutExt",
                temp,
                temp
            ),
            python = "python3 -u",
            typescript = "deno run",
            javascript = "node $dir/$fileName",
            dart = "dart $fileName",
            scss = "sass $dir/$fileName $dir/$fileNameWithoutExt.css",
            lua = "cd $dir && lua $fileName",
        },
        mode = "float",
        focus = true,
        startinsert = true,
        term = {
            position = "bot",
            size = 10,
        },
        float = {
            close_key = "<ESC>",
            border = "rounded",
            height = 0.8,
            width = 0.8,
            x = 0.5,
            y = 0.5,
            border_hl = "FloatBorder",
            float_hl = "Normal",
            blend = 0,
        },
    },
}
