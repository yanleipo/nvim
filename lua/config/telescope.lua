local builtin = require('telescope.builtin')
local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")
local fb = require("telescope").load_extension "file_browser"
local neo = require("telescope").load_extension "neoclip"

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
      '-L',
    },
  },
})

vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find( {} )
end, { desc = '[/] Fuzzily search in current buffer]' })
