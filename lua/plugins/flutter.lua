local has_fvm = vim.fn.executable("fvm") == 1

return {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    opts = {
        fvm = has_fvm,
        flutter_path = has_fvm and (vim.fn.expand("$HOME") .. "/fvm/versions/stable/bin/flutter") or nil,
    },
}
