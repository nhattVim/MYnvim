return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        -- find root directory
        local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        local root_dir = require("jdtls.setup").find_root(root_markers)

        -- check if root directory is found, fallback to current directory
        if root_dir == "" or root_dir == nil then
            root_dir = vim.fn.getcwd()
        end

        -- local library path
        local libraries = {}

        -- add project lib to libraries
        if root_dir and root_dir ~= "" then
            table.insert(libraries, root_dir .. "/**/*.jar")
        end

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

            root_dir = root_dir,

            settings = {
                java = {
                    signatureHelp = { enabled = true },
                    extendedClientCapabilities = extendedClientCapabilities,
                    maven = { downloadSources = true },
                    referencesCodeLens = { enabled = true },
                    references = { includeDecompiledSources = true },
                    inlayHints = { parameterNames = { enabled = "all" } },
                    format = { enabled = true },
                    project = {
                        referencedLibraries = libraries,
                    },
                },
            },

            init_options = {
                bundles = bundles,
            },

            on_attach = function(_, bufnr)
                -- Lsp common keymaps
                require("core.utils").set_lsp_keymaps(bufnr)
                -- Jdtls specific keymaps
                require("core.utils").set_keys(bufnr, {
                    { "n", "<leader>J", "", "Java" },
                    { "n", "<leader>Jo", jdtls.organize_imports, "Organize imports" },
                    { "n", "<leader>Jt", jdtls.test_class, "Test class" },
                    { "n", "<leader>JT", jdtls.test_nearest_method, "Test nearest method" },
                    { "n", "<leader>Jv", jdtls.extract_variable, "Extract variable" },
                    { "n", "<leader>Jc", jdtls.extract_constant, "Extract constant" },
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
