# Neovim 配置说明

## 概述

> 这是一个全面的 Neovim 配置，旨在通过集成各种插件和自定义设置来提升编码体验。该配置采用模块化组织，易于管理和扩展。

## 前提条件

- **Neovim**：请确保已安装 Neovim。此配置在 [若可能，请指定版本] 版本的 Neovim 上进行了测试。
- **Git**：用于插件的安装和管理。
- **其他依赖项**：部分插件可能有额外的依赖项，例如某些语言服务器需要 `node.js`，特定的格式化工具需要 `python`。

## 安装步骤

1. **克隆配置文件**：
   - 将此仓库克隆到你的 Neovim 配置目录（在 Linux 系统中通常为 `~/.config/nvim`，在 Windows 系统中为 `%LOCALAPPDATA%\nvim`）。
1. **安装插件**：
   - 配置使用了自定义的超级安装器（`super-installer.lua`）。启动 Neovim，安装器将自动下载并设置所需的插件。
1. **验证安装**：
   - 打开 Neovim 并检查是否有错误消息。如果没有错误，说明安装可能已成功。

## 配置详情

### 1. 模块加载

> `init.lua` 文件负责加载各种模块。它使用 `getModulePath` 函数在 `lua` 目录中查找每个模块的路径。以下是加载的模块列表：

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

> 如果模块启用，将调用其 `Config` 函数。

### 2. 快捷键绑定 (`keymaps.lua`)

> 设置了快捷键以方便访问 LSP 功能：

- `gd`：跳转到光标下符号的定义处。
- `gD`：跳转到光标下符号的声明处。
- `gi`：显示光标下符号的所有实现。
- `gt`：跳转到光标下符号的类型定义处。

### 3. 语言服务器协议 (LSP)

> 为不同的编程语言配置了多个 LSP 服务器：

- **Vue**：为 Vue.js 开发设置了 `volar`，支持多种相关文件类型。
- **TypeScript**：`ts_ls` 搭配自定义插件以支持 Vue TypeScript。
- **HTML、CSS、JSON**：`html`、`cssls` 和 `jsonls` 配置了代码片段支持。
- **Python**：`pylsp` 带有自定义的代码风格设置。
- **Java**：`jdtls` 用于 Java 开发。
- **Bash**：`bashls` 用于 Bash 脚本编写。
- **C/C++**：`clangd` 用于 C 和 C++ 代码。
- **Emmet**：`emmet_ls` 用于 HTML 和 CSS 缩写扩展。

### 4. 代码格式化 (`formatter.lua`)

> 使用 `formatter.nvim` 插件为各种文件类型进行代码格式化。支持的文件类型包括 `json`、`javascript`、`typescript`、`html`、`vue`、`css`、`lua`、`python`、`markdown`、`go`、`bash` 等。

### 5. Treesitter (`tree-sitter.lua`)

> `nvim-treesitter` 插件配置了语法高亮、增量选择、缩进、彩虹括号和自动标签等功能，适用于多种文件类型。

### 6. UI 和视觉增强

- **Noice**：提供更好的命令行和消息显示体验。
- **Lualine**：配置了带有自定义主题的状态栏。
- **Nvim-Tree**：一个带有自定义图标和过滤选项的文件资源管理器。
- **Transparent**：允许设置透明背景。
- **Miracle-Of-God**：一个眼前一亮的主题

### 7. 代码补全和代码片段

- **Nvim-Cmp**：一个支持多种补全源（如 LSP、缓冲区、路径和代码片段）的补全插件。
- **LuaSnip**：用于代码补全的代码片段引擎。

### 8. AI

- **CodeCompanion**：基于DeepSeek的AI模型

## 自定义设置

- **全局和选项设置**：`custom.lua` 文件包含全局和选项设置，如 `mapleader`、`number`、`tabstop` 等。你可以根据自己的喜好修改这些设置。
- **插件配置**：每个插件的配置可以在其对应的 Lua 文件中进行调整。例如，如果你想更改特定语言的 LSP 设置，可以修改 `lsp/mason/conf` 目录中的相应 LSP 配置文件。

## 故障排除

- **插件安装错误**：检查 Neovim 的错误消息。确保你有稳定的网络连接，并且所有必要的依赖项都已安装。
- ## **LSP 无法正常工作**：确保所需的语言服务器已安装并正确配置。你可以检查 `lsp/mason/conf` 目录中的特定 LSP 配置文件。

## 贡献

> 如果你发现任何问题或有改进建议，请随时创建一个 issue 或提交一个拉取请求。
