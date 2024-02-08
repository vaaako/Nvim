# Neovim Setup

# About
This is my basic `Neovim` setup, is **Lightweight**, **Customizable**, **Simple** and **Functional**,
 I don't need nothing more than this, is perfect for me

Uses **Lazy** for plugin manager along with various plugins such as **LSP**,
 **Mason**, and **Treesitter** for enhanced functionality

## Some Plugins
- Auto closing with (nvim-autopairs)[https://github.com/windwp/nvim-autopairs]
- Nerd icons with (nvim-web-devicons)[https://github.com/nvim-tree/nvim-web-devicons]
- File browsing with (nvim-tree)[https://github.com/nvim-tree/nvim-tree.lua]
- File searching with (telescope.nvim)[https://github.com/nvim-telescope/telescope.nvim]
- Built in terminal with (togleterm.nvim)[https://github.com/akinsho/toggleterm.nvim]
- Git info with (gitsigns.nvim)[https://github.com/lewis6991/gitsigns.nvim]
- Autocompletion with (nvim-cmp)[https://github.com/hrsh7th/nvim-cmp]
- Better syntax highlighting with (nvim-treesitter)[https://github.com/nvim-treesitter/nvim-treesitter]
- **LSP** configuration with (nvim-lspconfig)[https://github.com/neovim/nvim-lspconfig] and (mason.nvim)[https://github.com/williamboman/mason.nvim]


# Install
## Requirements
- Neovim
- Git
- Some [Nerd Font](https://www.nerdfonts.com/)


## Install
First make a backup of your current **Neovim** config *(it will be deleted)*

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Delete old **Neovim** folder
```sh
rm -rf ~/.config/nvim/*
```

Now run the command
```sh
git clone https://github.com/vaaako/Nvim ~/.config/nvim --depth 1 && nvim
```

Plugins should start to install when opening **Neovim**

## Uninstall
```sh
rm -rf ~/.config/nvim	  # Remove configs
rm -rf ~/.local/share/nvim # Remove plugins
```


# Controls
Leader key: **Space**

These are not all the commands, just the basic ones

## Completion Navigation
- **Enter**: Confirms selection
- **Ctrl + [j | k]**: Moves up and down between snippets
- **Ctrl + e**: Closes the snippet window

- **Shift + Tab**: Moves selection upward
	+ Same as **Ctrl + k**

- **TAB**: Progresses to the next snippet location *(after selection a snippet)*
	+  In snippet window acts like **Ctrl + j**
- **Ctrl + Space**: Forces completion window to show up

## Miscellaneous
- **gf**: Navigates to a directory
	+ Cursor needs to hover a directory location
- **Shift + K**: Shows definition of a function
- **Ctrl + /**: Opens a terminal inside **neovim**

## Leader
Youo can see all *Leader Commands* by pressing `<leader>` and waiting a bit

>Buffer is a tab

For additional shortcuts, refer to `keymap.lua`.

# Custom Configuration
Configuration files reside in `~/.config/nvim`, with every file located in the `lua/user` directory
 *(except `init.lua`)*

## Keymaps
Specify key mappings in `keymap.lua`

## Options
Set **Neovim** options

## Colorscheme
To alter the colorscheme, modify in `init.lua` *(last lines)*

## LSP
To add a new server, add to `lua/user/lsp/mason.lua`, and if you want to add a config file,
 add to `lua/user/lsp/settings`

Alternativally you can run the command: `:MasonInstall <servername>` or
 opening **Mason** with the command: `:Mason` and pressing `Shift + I` to install the desired
 server *(`Shift + X` to uninstall)*

You can see all server names with the command `:Mason`

## Treesitter
Add a new language to `lua/user/config/treesitter.lua` or with the command: `TSIntall <language>`

## Plugins
- Desired plugins can be added in `init.lua`
- Optionally, adjust plugins in `plugin.lua`
- Plugins are automatically updated and installed when restarting **Neovim**


For plugin configuration, utilize the following format:
```lua
require("author/plugin_name")
```

But some plugins are required to import to work

```lua
{
	"author/plugin_name",
	config = function()
		require("plugin_name").setup({ 
			-- Plugin configs here
		})
	end
}
```


If the plugin configurations is too long, you can make a *plugin config file* in `lua/user/configs/`,
 add your plugin file and move all inside `config = function() ... end` to it

### Example
On plugins
```lua
plugins.config.plugins  = {
	-- ...
	"author/plugin_name"
}
```

On `lua/user/configs/plugin_name.lua`
```lua
local plugin_name = require("plugin_name")

plugin_name.setup({
	-- ...
})
```

# Credits
Made by me

[Neovim from Scratch](https://github.com/LunarVim/Neovim-from-scratch/) inspired to start
