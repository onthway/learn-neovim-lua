local status, autosave = pcall(require, "auto-save")
if not status then
  vim.notify("没有找到 auto-save")
  return
end
autosave.setup({
  enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
  execution_message = {
    message = function() -- message to print on save
      return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
    dim = 0.18, -- dim the color of `message`
    -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    cleaning_interval = 2250,
  },
  -- vim events that trigger auto-save. See :h events
  trigger_events = { "InsertLeave", "TextChanged" },
  -- function that determines whether to save the current buffer or not
  -- return true: if buffer is ok to be saved
  -- return false: if it's not ok to be saved
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")

    if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  -- write all buffers when the current one meets `condition`
  write_all_buffers = false,
  -- saves the file at most every `debounce_delay` milliseconds
  debounce_delay = 10000,
  delay = 100,

  callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    after_saving = nil, -- ran after doing the actual save
  },
})
