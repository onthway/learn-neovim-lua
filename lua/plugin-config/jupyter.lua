---- IRON-REPL ----------------------------------------------------------------

local iron = require("iron")

iron.core.add_repl_definitions({
  python = {
    venv_python = {
      command = "pipenv run ipython",
    },
  },
})

iron.core.set_config({
  preferred = {
    python = "venv_python",
  },
})

vim.cmd([[nnoremap <silent><c-v> <Plug>(iron-visual-send)]])
vim.cmd([[nnoremap <C-l> <Plug>(iron-send-line)]])

---- NVIM-IPY -----------------------------------------------------------------

vim.g.nvim_ipy_perform_mappings = 0
vim.g.ipy_celldef = "# %%"

vim.cmd([[map <silent><c-s> <Plug>(IPy-Run)]])
vim.cmd([[map <leader>rc <Plug>(IPy-RunCell)]])

vim.cmd([[nmap ]x ctrih/^# %%<CR><CR>]])
vim.cmd([[nmap [x ctrah/^# %%<CR><CR>]])

vim.cmd([[map <leader>rc <Plug>(IPy-RunCell)]])

---- JUPYTER ASCENDING --------------------------------------------------------

vim.cmd([[ nnoremap <silent><c-x> <Plug>JupyterExecute ]])
vim.cmd([[ nnoremap <silent><c-X> <Plug>JupyterExecuteAll ]])

-- Starts Qt console and connect to pipenv ipykernel
vim.cmd([[command! -nargs=0 RunQtPipenv call StartConsolePipenv('jupyter qtconsole')]])

-- Starts Qt console and connect to an existing ipykernel
vim.cmd([[command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --existing")]])

-- Starts pipenv ipykernel
vim.cmd([[command! -nargs=0 RunPipenvKernel terminal /bin/bash -i -c 'pipenv run python -m ipykernel']])
vim.cmd([[command! -nargs=0 RunPoetryKernel terminal /bin/bash -i -c 'poetry run python -m ipykernel']])

-- Connects nvim-ipy to the existing ipykernel (non-interactive)
vim.cmd([[command! -nargs=0 ConnectToPipenvKernel call ConnectToPipenvKernel()]])

-- Connects nvim-ipy to the existing ipykernel (interactive)
vim.cmd([[command! -nargs=0 ConnectConsole terminal /bin/bash -i -c 'jupyter console --existing']])
vim.cmd([[command! -nargs=0 AddFilepathToSyspath call AddFilepathToSyspath()]])
