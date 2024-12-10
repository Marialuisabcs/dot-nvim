return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}

-- USAGE
-- ys -> surround text with something
-- iw -> select inner (i) word (w)
-- add surround char needed -> ({""})''
-- ds{surround char} -> delete the surrounding char
-- cs{current surrounding char} {new surrounding char} -> substitute surrounding char
