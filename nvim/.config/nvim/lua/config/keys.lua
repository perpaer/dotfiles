vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- regular stuff
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-q>', ':bd<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<C-b>', ':bufdo bd', { desc = 'Close buffers' })
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- split resize
vim.keymap.set('n', '<M-Up>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<M-Down>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-Right>', ':vertical resize +2<CR>', { silent = true })

-- diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.jump, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.jump, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope
-- local git_files_cmd = ':Telescope git_files<CR>'
local find_files_cmd =
':Telescope find_files find_command=rg,--ignore,--hidden,--glob,!.git/**,--files prompt_prefix=🔍<CR>'
vim.keymap.set('n', '<leader><leader>', find_files_cmd, { desc = 'Find files', silent = true })
vim.keymap.set('n', '<leader>ff', find_files_cmd, { desc = 'Find files', silent = true })
-- vim.keymap.set('n', '<leader>F', find_files_cmd, { desc = 'Find files', silent = true })

vim.keymap.set('n', '<leader>t', ':Telescope <CR>', { desc = 'Telescope open', silent = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers <CR>', { desc = 'Go to file in [b]uffers', silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep <CR>', { desc = 'Grep', silent = true })
vim.keymap.set('n', '<leader>fr', ':Telescope lsp_references<CR>', { desc = 'Find code references', silent = true })
vim.keymap.set('n', '<leader>fd', ':Telescope lsp_definitions<CR>', { desc = 'Find code definitions', silent = true })
vim.keymap.set('n', '<leader>fi', ':Telescope lsp_implementations<CR>',
  { desc = 'Find code implementations', silent = true })
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_workspace_symbols<CR>',
  { desc = 'Find workspace symbols', silent = true })

-- Tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal <CR>', { desc = 'Directory Tre[e]', silent = true })

-- Git
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'LazyGit' })

-- Coding
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', '<C-f>', ':EslintFixAll<CR>', { desc = 'ESLint fix file' })

vim.keymap.set('n', '<F8>', ':DapContinue<CR>', { desc = 'Debug: Start/Continue' })

vim.keymap.set('n', '<leader>ns', "<cmd>lua require('package-info').show()<cr>", { silent = true, noremap = true })
