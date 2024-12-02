local color1_bg = "#f265b5"
local color2_bg = "#37f499"
local color3_bg = "#04d1f9"
local color4_bg = "#a48cf2"
local color5_bg = "#f1fc79"
local color6_bg = "#f7c67f"
local color0_fg = "#323449"

return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        -- "iamcco/markdown-preview.nvim",
        -- build = "npm install",
    },
    ft = { "markdown", "Avante" },
    opts = {
        heading = {
            sign = true,
            icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },

            vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color0_fg, color1_bg)),
            vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color0_fg, color2_bg)),
            vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color0_fg, color3_bg)),
            vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color0_fg, color4_bg)),
            vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color0_fg, color5_bg)),
            vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color0_fg, color6_bg)),

            vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg)),
            vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg)),
            vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg)),
            vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg)),
            vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg)),
            vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg)),

            backgrounds = {
                "Headline1Bg",
                "Headline2Bg",
                "Headline3Bg",
                "Headline4Bg",
                "Headline5Bg",
                "Headline6Bg",
            },

            foregrounds = {
                "Headline1Fg",
                "Headline2Fg",
                "Headline3Fg",
                "Headline4Fg",
                "Headline5Fg",
                "Headline6Fg",
            },
        },

        file_types = { "markdown", "Avante" },
    },
}
