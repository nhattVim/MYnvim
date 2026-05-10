return {
    "emrearmagan/atlas.nvim",
    cmd = {
        "AtlasLogs",
        "AtlasIssues",
        "AtlasPulls",
        "AtlasJqlSearch",
        "AtlasClearCache",
    },
    dependencies = {
        "MeanderingProgrammer/render-markdown.nvim", -- optional but recommended (Jira)
        "sindrets/diffview.nvim", -- optional (PullRequest diff)
        "esmuellert/codediff.nvim", -- optional (PullRequest diff alternative)
    },
    config = function()
        require("atlas").setup({
            pulls = {
                providers = {
                    github = {}, -- See configuration below
                },
            },
            issues = {
                providers = {
                    jira = {}, -- See configuration below
                },
            },
        })
    end,
}
