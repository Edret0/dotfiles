vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=1 guibg=grey]])
-- vim.opt["guicursor"] = ""
vim.cmd("set rtp^=/home/edret/.opam/default/share/ocp-indent/vim")
-- vim.cmd("set guicursor=a:hor100")
vim.lsp.inlay_hint.enable(true)
vim.cmd [[
  autocmd BufRead,BufNewFile *.vert,*.frag,*.geom set filetype=glsl
]]
