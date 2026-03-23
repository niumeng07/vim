vim.api.nvim_create_user_command("Gvd", function()
	vim.cmd("Gitsigns diffthis")
end, {})

vim.api.nvim_create_user_command("Git", function()
	vim.cmd("LazyGit")
end, {})

vim.api.nvim_create_user_command("GitConfig", function()
	vim.cmd("LazyGitConfig")
end, {})

vim.api.nvim_create_user_command("GitCurrentFile", function()
	vim.cmd("LazyGitCurrentFile")
end, {})

vim.api.nvim_create_user_command("GitFilter", function()
	vim.cmd("LazyGitFilter")
end, {})

vim.api.nvim_create_user_command("GitFilterCurrentFile", function()
	vim.cmd("LazyGitFilterCurrentFile")
end, {})

vim.api.nvim_create_user_command("GitLog", function()
	vim.cmd("LazyGitLog")
end, {})
