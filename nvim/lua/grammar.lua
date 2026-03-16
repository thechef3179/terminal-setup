-- add ltex supper with mason
vim.lsp.config("ltex", {
    cmd = { "ltex-ls" },
    filetypes = { "markdown", "latex", "text" },
    settings = {
        ltex = {
            language = "en-US",
            diagnosticSeverity = "hint",
            additionalRules = {
                enablePreamble = true,
                enablePickyRules = true,
                languageModel = "~/.ngrams/",
            },
            completionEnabled = true,
        },
    },
})


