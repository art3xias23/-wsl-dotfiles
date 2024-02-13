require("toggleterm").setup{
function(term)
	if term.direction == "horizontal" then
		return 15
	elseif term.direction == "vertical" then
		return 0.4 * vim.o.columns
	end
end,
open_mapping = "<leader>t",
direction = "float"
}
