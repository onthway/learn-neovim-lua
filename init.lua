require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置
require("colorscheme")
-- 输入法自动切换
require("utils.im-select")
-- 复制到windows剪贴板
require("utils.fix-yank")

-- 插件配置
require("utils.global")
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.nvim-treesitter")
require("plugin-config.telescope")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.surround")
require("plugin-config.nvim-colorizer")
require("plugin-config.diffview")
require("plugin-config.indent-blankline")
require("plugin-config.lualine")
-- require('plugin-config/feline')
require("plugin-config.dashboard")
require("plugin-config.project")
-- lua require('plugin-config/which-key')
-- require("plugin-config.formatter")
-- require("plugin-config.toggleterm")
-- gitsigns
require("plugin-config.gitsigns")

-- 内置LSP
require("plugin-config/rust-tools")
require("lsp/setup")
require("lsp/nvim-cmp")
require("lsp/ui")
require("plugin-config.null-ls")