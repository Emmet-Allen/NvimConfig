return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = {'lua_ls','omnisharp','dockerls','gopls','ts_ls','ltex','pylsp','yamlls','jdtls' }
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup({
				capabilities = capabilities})
			lspconfig.omnisharp.setup ({
        capabilities = capabilities,
        cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        enable_import_completion = true,
        organize_imports_on_format = true,
        enable_roslyn_analyzers = true,
        root_dir = function ()
					return vim.loop.cwd() -- current working directory
                end,
            })
			lspconfig.ts_ls.setup({
				capabilities = capabilities})
			lspconfig.pylsp.setup({
				capabilities = capabilities})
			lspconfig.jdtls.setup({
				capabilities = capabilities})
			lspconfig.gopls.setup({
				capabilities = capabilities})

			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
