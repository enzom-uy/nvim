local config = {
    cmd = { '/opt/jdtls/jdt-language-server-1.49.0-202507311558/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
