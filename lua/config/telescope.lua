local builtin = require('telescope.builtin')
local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")

require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { scroll_speed = 1, width = 0.9, preview_width = 0.5}
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '-uuu',
    },
  },
})

local fb = require("telescope").load_extension "file_browser"
local neo = require("telescope").load_extension "neoclip"

vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find( {} )
end, { desc = '[/] Fuzzily search in current buffer]' })
-- vim.keymap.set('n', '<leader>/', function()
-- 	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
-- 		winblend = 10,
-- 		previewer = true,
-- 	})
-- end, { desc = '[/] Fuzzily search in current buffer]' })

-- vim.keymap.set('n', '<leader><space>', builtin.buffers, { })
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
-- vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
-- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
-- -- vim.keymap.set('n', '<leader>fc', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })<CR>', {})
-- 
-- vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
-- vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
-- 
-- vim.keymap.set('n', '<leader>fs', builtin.treesitter, {})
-- vim.keymap.set('n', '<leader>fc', builtin.builtin, {})
-- 
-- vim.keymap.set("n", "<leader>z", t.extensions.zoxide.list)
-- 
-- vim.keymap.set("n", "<leader>dir", fb.file_browser, {})
