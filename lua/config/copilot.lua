vim.keymap.set("i", "<C-e>", function()
	vim.api.nvim_feedkeys(
		vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
		"i",
		true
	)
end)
