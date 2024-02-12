vim.lsp.set_log_level("debug")

local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
})

local lua_opts = lsp_zero.nvim_lua_ls()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lua_opts)

local function convert_windows_to_wsl_path(windows_path)
    if not windows_path then return nil end
    local path = windows_path:gsub("\\", "/")
    path = path:gsub("^%a:", function(drive)
        return "/mnt/" .. drive:lower()
    end)
    return path
end

-- Function to dynamically convert paths in the LSP configuration
local function on_new_config(new_config, _)
    if new_config.cmd then
        for i, cmd_part in ipairs(new_config.cmd) do
            -- Check if the cmd part is a Windows path and convert it
            if cmd_part:match("^%a:\\") then
                new_config.cmd[i] = convert_windows_to_wsl_path(cmd_part)
            end
        end
    end
    if new_config.root_dir then
        -- Convert the root directory
        new_config.root_dir = convert_windows_to_wsl_path(new_config.root_dir)
    end
end

-- Modify the root_dir function to detect and convert Windows paths
local function modified_root_dir(fname)
    local root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj")(fname)
    return convert_windows_to_wsl_path(root_dir)
end

lspconfig.omnisharp.setup({
	settings = {
		["omnisharp"] = {
			enable_roslyn_analysers = true,
			enable_import_completion = true,
			organize_imports_on_format = true,
			filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props" },
		},
	},
	root_dir = modified_root_dir,
	on_new_config = on_new_config
})

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"omnisharp",
	},
	handlers = {
		lsp_zero.default_setup,

		omnisharp = function()
			lspconfig.omnisharp.setup({
				handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler },
			})
		end,
	},
})
