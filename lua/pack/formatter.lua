vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		-- Core languages
		lua = { "stylua" },
		python = { "isort", "black" },
		haskell = { "hindent" },

		-- Web / frontend
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		scss = { "prettierd", "prettier" },
		less = { "prettierd", "prettier" },
		json = { "jq" },
		jsonc = { "jq" },
		markdown = { "prettierd", "prettier" },
		vue = { "prettierd", "prettier" },
		svelte = { "prettierd", "prettier" },
		yaml = { "jq" },

		-- Infra / scripts
		sh = { "shfmt" },
		bash = { "shfmt" },
		fish = { "fish_indent" },
		nix = { "alejandra" },
		dockerfile = { "shfmt" },
		hyprlang = { "shfmt" },

		-- Compiled / typed
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofumpt", "goimports" },
		rust = { "rustfmt" },
		java = { "google-java-format" },

		-- Data / query
		sql = { "sqlfluff", "pg_format" },
		toml = { "jq" },
	},

	formatters = {
		shfmt = {
			command = "shfmt",
			args = { "-i", "2", "-ci" },
			stdin = true,
		},
		fish_indent = {
			command = "fish_indent",
			args = { "-" },
			stdin = true,
		},
		jq = {
			command = "jq",
			args = { "." },
			stdin = true,
		},
	},
})
