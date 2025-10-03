return {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    opts = {
        fvm = true,
        flutter_path = vim.fn.expand("$HOME") .. "/fvm/versions/stable/bin/flutter",
        lsp = {
            on_attach = function(_, bufnr)
                require("core.utils").set_lsp_keymaps(bufnr)
            end,
        },
    },
}
