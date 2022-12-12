local status, iron = pcall(require, "iron.core")
if not status then
  vim.notify("没有找到 iron")
end
local status, view = pcall(require, "iron.view")
if not status then
  vim.notify("没有找到 iron")
end

iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
    repl_open_cmd = view.split.vertical.botright(50),
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
})
