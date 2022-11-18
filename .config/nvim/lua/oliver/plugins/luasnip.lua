local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}

-- always moved to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true})

-- always moved to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true})

-- selecting within a list of options
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_action() then
        ls.change_choice(1)
    end
end, { silent = true})
