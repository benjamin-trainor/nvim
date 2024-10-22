return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = {},
	event = {},
	ft = {},
	keys = {},
	opts = function(_, opts)
		opts.filesystem = {
			bind_to_cwd = true,
			follow_current_file = { enabled = false },
			use_libuv_file_watcher = true,
		}
	end,
	dependencies = {},
}
