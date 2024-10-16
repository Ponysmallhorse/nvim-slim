require("dap-go").setup()
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

print("DAP initializing")

local dap = require("dap")
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "Default python launch",
	program = "${file}",
	cwd = "${workspaceFolder}",
})

-- require("dapui").setup()
-- {
-- icons = { expanded = "▾", collapsed = "▸" },
-- mappings = {
--     -- Use a table to apply multiple mappings
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
-- },
-- sidebar = {
--     -- You can change the order of elements in the sidebar
--     elements = {
--         -- Provide as ID strings or tables with "id" and "size" keys
--         {
--             id = "scopes",
--             size = 0.25, -- Can be float or integer > 1
--         },
--         { id = "breakpoints", size = 0.25 },
--         { id = "stacks",      size = 0.25 },
--         { id = "watches",     size = 00.25 },
--     },
--     size = 40,
--     position = "left", -- Can be "left", "right", "top", "bottom"
-- },
-- tray = {
--     elements = { "repl" },
--     size = 10,
--     position = "bottom", -- Can be "left", "right", "top", "bottom"
-- },
-- floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--         close = { "q", "<Esc>" },
--     },
-- },
-- windows = { indent = 1 },
-- })
-- require("dap.ext.vscode").load_launchjs()
