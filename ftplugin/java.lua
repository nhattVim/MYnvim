-- workspace path theo project
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

if vim.fn.isdirectory(install_path) == 0 then
    return
end

-- extended capabilities
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
            maven = { downloadSources = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            inlayHints = { parameterNames = { enabled = "all" } },
            format = { enabled = true },
        },
    },

    init_options = {
        bundles = {
            vim.fn.glob(
                vim.fn.stdpath("data")
                    .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
            ),
        },
    },

    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
        -- refresh codelens when server ready
        pcall(vim.lsp.codelens.refresh)

        -- refresh codelens on save
        vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = bufnr,
            callback = function()
                pcall(vim.lsp.codelens.refresh)
            end,
        })
    end,
}

jdtls.start_or_attach(config)
