local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>t", ":Ex<cr>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-\\>", ":close<cr>", opts)

-- Resize with arrow
keymap("n", "<A-->", ":resize -2<CR>", opts)
keymap("n", "<A-=>", ":resize +2<CR>", opts)
keymap("n", "<A-[>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-]>", ":vertical resize +2<CR>", opts)
--
-- focus window toggle
keymap("n", "<F9>", ":MaximizerToggle<CR>", opts)
keymap("v", "<F9>", ":MaximizerToggle<CR>gv", opts)
keymap("i", "<F9>", "<C-o>:MaximizerToggle<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- windows
keymap("n", "<leader>o", ":sp<cr>", opts) -- open window below
keymap("n", "<leader>p", ":vs<cr>", opts) -- open window to left

-- Telescope key
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

vim.keymap.set('n', 'Q', '<nop>', {})
vim.keymap.set('n', '<leader>qq', ":q<cr>", {})

-- DAP
keymap("n", "<F10>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F7>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F4>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F5>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F6>", ":lua require('dap').step_out()<CR>", opts)

keymap("v", "<Leader>h", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)
keymap("n", "<leader>h", ":lua require('dap.ui.variables').hover()<CR>", opts)

keymap("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

keymap("n", "<S-F10>", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<C-F7>", ":lua require('dap').repl.run_last()<CR>", opts)

keymap("n", "<C-F2>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<S-F2>", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", opts)

keymap("n", "<Leader>dvv", ":lua require('dap.ui.variables').scopes()<CR>", opts)
