return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
        "nvim-neotest/nvim-nio", --> lib for debug feature
    },
    config = function()
        local workspace_path = vim.fn.stdpath("data") .. "/site/java/jdtls-workspace/"
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = workspace_path .. project_name
        local install_path = vim.fn.expand("$MASON/packages/jdtls")
        local os
        if vim.fn.has("macunix") == 1 then
            os = "mac"
        elseif vim.fn.has("win32") == 1 then
            os = "win"
        else
            os = "linux"
        end

        local status, jdtls = pcall(require, "jdtls")
        if not status then
            return
        end

        local extendedClientCapabilities = jdtls.extendedClientCapabilities

        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-javaagent:" .. install_path .. "/lombok.jar",
                "-jar",
                vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                "-configuration",
                install_path .. "/config_" .. os,
                "-data",
                workspace_dir,
            },

            root_dir = require("jdtls.setup").find_root({
                ".git",
                "mvnw",
                "gradlew",
                "pom.xml",
                "build.gradle",
            }),

            settings = {
                java = {
                    signatureHelp = { enabled = true },
                    extendedClientCapabilities = extendedClientCapabilities,
                    maven = {
                        downloadSources = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    references = {
                        includeDecompiledSources = true,
                    },
                    inlayHints = {
                        parameterNames = {
                            enabled = "all", -- literals, all, none
                        },
                    },
                    format = {
                        enabled = true,
                    },
                },
            },

            init_options = {
                bundles = {
                    vim.fn.glob(
                        vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
                            .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
                    ),
                    "\n",
                },
            },

            on_attach = function()
                local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = { "*.java" },
            callback = function()
                local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
        })

        jdtls.start_or_attach(config)
    end,
}
