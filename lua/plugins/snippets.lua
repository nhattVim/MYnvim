local lpath = vim.fn.stdpath("config") .. "/snippets"

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = vim.fn.has("win32") == 1 and "" or "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",

        {
            "chrisgrieser/nvim-scissors",
            cmd = {
                "ScissorsAddNewSnippet",
                "ScissorsEditSnippet",
            },
            opts = { snippetDir = lpath },
        },
    },
    config = function()
        local ls = require("luasnip")

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node

        -- Choice node keymap
        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        -- VSCode snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Custom JSON snippets
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { lpath },
        })

        local function get_comment_parts()
            local cs = vim.bo.commentstring

            local left, right = cs:match("^(.*)%%s(.*)$")

            left = vim.trim(left or "")
            right = vim.trim(right or "")

            return left, right
        end

        local function comment_snippet(trigger, choices, default)
            local nodes = {
                f(function()
                    local left = get_comment_parts()
                    return left
                end),

                t(" "),
            }

            -- Multiple choices
            if #choices > 1 then
                table.insert(
                    nodes,
                    c(
                        1,
                        vim.tbl_map(function(choice)
                            return t(choice)
                        end, choices)
                    )
                )

                table.insert(nodes, t(": "))
                table.insert(nodes, i(2, default or "comment"))

            -- Single choice
            else
                table.insert(nodes, t(choices[1]))
                table.insert(nodes, t(": "))
                table.insert(nodes, i(1, default or "comment"))
            end

            table.insert(
                nodes,
                f(function()
                    local _, right = get_comment_parts()

                    if right ~= "" then
                        return " " .. right
                    end

                    return ""
                end)
            )

            return s(trigger, nodes)
        end

        ls.add_snippets("all", {
            comment_snippet("fix", {
                "FIX",
                "BUG",
                "ISSUE",
            }),

            comment_snippet("perf", {
                "PERF",
                "PERFORMANCE",
                "OPTIMIZE",
            }),

            comment_snippet("test", {
                "TEST",
                "TESTING",
                "PASSED",
                "FAILED",
            }),

            comment_snippet("warn", {
                "WARN",
                "WARNING",
                "XXX",
            }),

            comment_snippet("note", {
                "NOTE",
                "INFO",
            }),

            comment_snippet("todo", {
                "TODO",
            }),

            comment_snippet("hack", {
                "HACK",
            }),
        })
    end,
}
