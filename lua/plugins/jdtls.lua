return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        -- workspace path
        local workspace_path = vim.fn.stdpath("data") .. "/site/java/jdtls-workspace/"
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = workspace_path .. project_name

        -- mason install path
        local install_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

        -- detect OS
        local os
        if vim.fn.has("macunix") == 1 then
            os = "mac"
        elseif vim.fn.has("win32") == 1 then
            os = "win"
        else
            os = "linux"
        end

        -- require jdtls
        local ok, jdtls = pcall(require, "jdtls")
        if not ok then
            return
        end

        -- check install path
        if vim.fn.isdirectory(install_path) == 0 then
            return
        end

        -- extended capabilities
        local extendedClientCapabilities = jdtls.extendedClientCapabilities
        extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

        -- java debug bundle
        local bundles = vim.split(
            vim.fn.glob(
                vim.fn.stdpath("data")
                    .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
            ),
            "\n",
            { trimempty = true }
        )

        -- java test bundles (plugin + runner)
        local java_test_jars = vim.split(
            vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar"),
            "\n",
            { trimempty = true }
        )

        -- add java test to bundles
        for _, jar in ipairs(java_test_jars) do
            local fname = vim.fn.fnamemodify(jar, ":t")
            if fname ~= "jacocoagent.jar" then
                table.insert(bundles, jar)
            end
        end

        -- jdtls config
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
                    maven = { downloadSources = true },
                    referencesCodeLens = { enabled = true },
                    references = { includeDecompiledSources = true },
                    inlayHints = { parameterNames = { enabled = "all" } },
                    format = { enabled = true },
                },
            },

            init_options = {
                bundles = bundles,
            },

            on_attach = function(_, bufnr)
                -- keymaps for jdtls
                require("core.utils").set_keys(bufnr, {
                    -- Navigation
                    { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
                    { "n", "gt", vim.lsp.buf.type_definition, "Go to type definition" },
                    { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
                    { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
                    { "n", "gr", vim.lsp.buf.references, "Find references" },

                    -- Info
                    { "n", "K", "<cmd>Lspsaga hover_doc<cr>", "Hover" },
                    { "n", "gK", vim.lsp.buf.signature_help, "Signature help" },
                    { "n", "gh", vim.diagnostic.open_float, "Show diagnostics" },

                    -- Edit
                    { "n", "gR", vim.lsp.buf.rename, "Rename symbol" },
                    { "n", "ga", vim.lsp.buf.code_action, "Code action" },

                    -- Format
                    {
                        "n",
                        "gf",
                        function()
                            vim.lsp.buf.format({ async = true })
                        end,
                        "Format buffer",
                    },

                    -- Jdtls keymaps
                    { "n", "<leader>J", "", "Java" },
                    {
                        "n",
                        "<leader>Jo",
                        function()
                            require("jdtls").organize_imports()
                        end,
                        "Organize imports",
                    },
                    {
                        "n",
                        "<leader>Jt",
                        function()
                            require("jdtls").test_class()
                        end,
                        "Test class",
                    },
                    {
                        "n",
                        "<leader>JT",
                        function()
                            require("jdtls").test_nearest_method()
                        end,
                        "Test nearest method",
                    },
                    {
                        "n",
                        "<leader>Jv",
                        function()
                            require("jdtls").extract_variable()
                        end,
                        "Extract variable",
                    },
                    {
                        "n",
                        "<leader>Jc",
                        function()
                            require("jdtls").extract_constant()
                        end,
                        "Extract constant",
                    },
                })

                -- refresh codelens when server ready
                pcall(vim.lsp.codelens.refresh)

                -- refresh codelens on save
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = "nhattVim",
                    buffer = bufnr,
                    callback = function()
                        pcall(vim.lsp.codelens.refresh)
                    end,
                })
            end,
        }

        -- Auto attach jdtls on every java file
        vim.api.nvim_create_autocmd("FileType", {
            group = "nhattVim",
            pattern = "java",
            callback = function()
                jdtls.start_or_attach(config)
            end,
        })
    end,
}
