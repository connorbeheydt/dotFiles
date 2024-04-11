The Primeregen has a git for all of his dot file configurations for Linux. This might be useful to easily configure nvim and other such configuration stuff.
# dotFiles
## Installing nvim
This can be a very frustrating process, so I figured it is a good idea to record how I have successfully installed nvim on different systems
### Ubuntu (wsl)
### Debian Bookworm (RPi5)
- Attempted tarball, did not work
- Attempted appimage, did not work
## Nvim Config
Config is done in `.config/nvim`. In this directory you have `after` for storing plugin config, `lua` for storing general config, and `init.lua` which initializes the config on startup.
### .vimrc
### Remaps
### Packer 
Packer is the plugin manager I use for nvim. You can sync plugins by going to `lua/limbo/packer.lua`, entering `:so` then `:PackerSync`.
#### Packer Plugins
- Harpoon: Hold files in easy to access register
- Telescope: Fuzzy finder
- Treesitter: Syntax highlighting
- nvim.obsidian: obsidian editor 
- [pomo.nvim](https://github.com/epwalsh/pomo.nvim): pomodoro timer
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim): LSP completion server
	- To get the Mason modules to work, you need to install nodejs and npm,
	- Also need to install zip and unzip
	- Needed to install python3.10-venv
- rose-pine/neovim: rose-pine theme
- vim-fugitive: Git wrapper 
This is in my config from ThePrimeregen video. No clue what this does.
```lua
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
```
## Tmux Config
### Remaps
# Install
