local config = {
    cmd = { '/opt/jdtls/jdt-language-server-1.49.0-202507311558/bin/jdtls' },
    root_dir = function()
        return vim.fs.dirname(vim.fs.find(
            { '.git', 'src' },
            { upward = true }
        )[1])
    end,
    settings = {
        java = {
            project = {
                referencedLibraries = {},
                sourcePaths = { "src" }
            }
        }
    }
}

require('jdtls').start_or_attach(config)
