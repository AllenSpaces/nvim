# Neovim Configuration README

## Overview

> This is a comprehensive Neovim configuration designed to enhance the
> coding experience by integrating a wide range of plugins and custom
> settings. The configuration is organized modularly, making it easy to
> manage and extend.

## Prerequisites

- **Neovim**: Make sure you have Neovim installed. This configuration is tested with Neovim version [specify version if possible].
- **Git**: Required for plugin installation and management.
- **Other Dependencies**: Some plugins may have additional dependencies, such as `node.js` for certain language servers or `python` for specific formatting tools.

## Installation

- Clone this repository to your Neovim configuration directory (usually `~/.config/nvim` on Linux or `%LOCALAPPDATA%\nvim` on Windows).

2. **Install Plugins**:
   - The configuration uses a custom super - installer (`super-installer.lua`). Start Neovim, and the installer will automatically download and set up the necessary plugins.
3. **Verify Installation**:
   - Open Neovim and check for any error messages. If there are no errors, the installation is likely successful.

## Configuration Details

### 1. Module Loading

> The `init.lua` file is responsible for loading various modules. It uses
> a `getModulePath` function to find the path of each module in the `lua`
> directory. The following modules are loaded:

```lua
local modules = {
    { moduleName = "commands", enabled = true },
    { moduleName = "keymaps", enabled = true },
    { moduleName = "custom", enabled = true },
    { moduleName = "file-icons", enabled = true },
    { moduleName = "nvim-tree", enabled = true },
    { moduleName = "tree-sitter", enabled = true },
    { moduleName = "transparent", enabled = true },
    { moduleName = "telescope", enabled = true },
    { moduleName = "noice", enabled = true },
    { moduleName = "formatter", enabled = true },
    { moduleName = "floaterm", enabled = true },
    { moduleName = "autopairs", enabled = true },
    { moduleName = "commenter", enabled = true },
    { moduleName = "lualine", enabled = true },
    { moduleName = "miracle-of-god", enabled = true },
    { moduleName = "mason", enabled = true },
    { moduleName = "lsp", enabled = true },
    { moduleName = "snips", enabled = true },
    { moduleName = "super-installer", enabled = true },
}
```

> Each module's `Config` function is called if the module is enabled.

### 2. Keybindings (`keymaps.lua`)

> Keybindings are set up to provide easy access to LSP features:

- `gd`: Navigate to the definition of the symbol under the cursor.
- `gD`: Navigate to the declaration of the symbol under the cursor.
- `gi`: Show all implementations of the symbol under the cursor.
- `gt`: Navigate to the type definition of the symbol under the cursor.

### 3. Language Server Protocol (LSP)

> Multiple LSP servers are configured for different programming languages:

- **Vue**: `volar` is set up for Vue.js development, supporting multiple related file types.
- **TypeScript**: `ts_ls` with a custom plugin for Vue TypeScript support.
- **HTML, CSS, JSON**: `html`, `cssls`, and `jsonls` are configured with snippet support.
- **Python**: `pylsp` with custom settings for code style.
- **Java**: `jdtls` for Java development.
- **Bash**: `bashls` for Bash scripting.
- **C/C++**: `clangd` for C and C++ code.
- **Emmet**: `emmet_ls` for HTML and CSS abbreviation expansion.

### 4. Code Formatting (`formatter.lua`)

> The `formatter.nvim` plugin is used to format code for various file
> types. Supported file types include `json`, `javascript`, `typescript`,
> `html`, `vue`, `css`, `lua`, `python`, `markdown`, `go`, `bash`, etc.

### 5. Treesitter (`tree-sitter.lua`)

> The `nvim-treesitter` plugin is configured to provide syntax highlighting,
> incremental selection, indentation, rainbow parentheses, and auto - tag
> features for multiple file types.

### 6. UI and Visual Enhancements

- **Noice**: Provides a better command - line and message display experience.
- **Lualine**: Configured status line with a custom theme.
- **Nvim - Tree**: A file explorer with custom icons and filtering options.
- **Transparent**: Allows for a transparent background.

### 7. Completion and Snippets

- **Nvim - Cmp**: A completion plugin with support for multiple sources such as LSP, buffer, path, and snippets.
- **LuaSnip**: A snippet engine used for code completion.

## Customization

- **Global and Option Settings**: The `custom.lua` file contains global and option settings such as `mapleader`, `number`, `tabstop`, etc. You can modify these settings according to your preferences.
- **Plugin Configuration**: Each plugin's configuration can be adjusted in its respective Lua file. For example, if you want to change the LSP settings for a specific language, you can modify the corresponding LSP configuration file in the `lsp/mason/conf` directory.

## Troubleshooting

- **Plugin Installation Errors**: Check the Neovim error messages. Make sure you have a stable internet connection and that all the necessary dependencies are installed.
- **LSP Not Working**: Ensure that the required language servers are installed and properly configured. You can check the `lsp/mason/conf` directory for specific LSP configurations.

## Contributing

> If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request.
