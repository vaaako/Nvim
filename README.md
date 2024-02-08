# Neovim Setup

# About
This is my basic `Neovim` setup, is fast, simple, basic and functional, I don't
 need nothing more than this, is perfect for me

Uses **Lazy** for plugin manager along with various plugins such as **LSP**,
 **Mason**, and **Treesitter** for enhanced functionality

# Install
First make a backup of your current **Neovim** config *(it will be deleted)*

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Now run the command
```sh
rm -rf ~/.config/nvim/* && git clone https://github.com/vaaako/Nvim ~/.config/nvim
```

Plugins should start to install when opening **Neovim**


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
- **Leader + ff**: Searches for files using Telescope
- **Leader + w**: Saves buffer
- **Leader + q**: Closes buffer

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
    "autor/plugin_name",
    config = function()
        require("plugin_name").setup({ 
            -- Plugin configs here
        })
    end
}
```


If the plugin configurations is too long, you can make a *plugin config file* in `lua/user/configs/`,
 add your plugin file and move all inside `config = function() ... end` to it

See the others config files to know how to do it

