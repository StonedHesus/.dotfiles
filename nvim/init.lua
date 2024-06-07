require('config') require('plugins')
require("bluloco").setup({
    style="auto",
    transparent=true,
    italics=false,
    terminal=vim.fn.has("gui_running") == 1,
    guicursor=true,
})
vim.opt.termguicolors = true
--vim.cmd('colorscheme melange')
vim.cmd('colorscheme gruvbox')
vim.g.coc_python_pythonExecutable = '/usr/bin/python3'
--local cmp = require("cmp")
--local lspconfig = require("lspconfig")
local lspkind = require("lspkind")
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--lspconfig.pyright.setup({ 
--on_attach = function(client)
--require("lsp_signature").on_attach({
--bind = true,
--handler_opts = {
--border = "single",
--},
--})
--end,
--capabilities = capabilities,
--})
-- Bash lsp
--lspconfig.bashls.setup({})
-- Go lsp
--lspconfig.gopls.setup({})
-- Swift lsp
--lspconfig.sourcekit.setup({})
-- Java jdtls lsp
-- Clang C/C++ lsp and autocomplete configuration.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--require('cmp_nvim_lsp').setup({
--  capabilities = capabilities,
--})
--lspconfig.clangd.setup({
--    on_attach = function(client)
--        require("lsp_signature").on_attach({
--            bind = true,
--            handler_opts = {
--                border = "single",
--            },
--        })
--    end,
--    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--})

-- javadsl Java lsp and autocomplete configuration.
--require('lspconfig').jdtls.setup ({
--    cmd = { "jdtls" },
--    on_attach = function(client, bufnr)
--        require('lsp_signature').on_attach({
--            bind = true,
--            handler_opts = {
--                border = "single",
--            },
--        })
--    end,
--    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--})
-- OCaml LSP configuration
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true 

--lspconfig.ocamllsp.setup {
--    capabilities = capabilities,
--    on_attach = function(client) 
--        require('completion').on_attach(client)
--    end,
--    cmd = { 'ocamllsp' },
--}
--lspconfig.ocamlmerlin.setup({capabilities = capabilities,})

--lspconfig.ocamllsp.setup({
--    cmd = { "ocamllsp" }, 
--    on_attach = function(client)
--        require("lsp_signature").on_attach({
--            bind = true,
--            handler_opts = {
--                border = "single",
--            },
--        })
--    end,
--    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--})

-- Lua lsp
--lspconfig.lua_ls.setup({})
-- Ruby lsp
--lspconfig.solargraph.setup({})
-- JavaScript/Typescript LSP
--lspconfig.tsserver.setup({})
-- HTML LSP
--lspconfig.html.setup({})
-- CSS LSP
--lspconfig.cssls.setup({})
-- Formatter
require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args) 
        require("conform").format({ bufnr = args.buf })
    end,
    })

local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

--metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--cmp.setup({
--    snippet = {
--        expand = function(args)
--            vim.fn["vsnip#anonymous"](args.body)
--            require('luasnip').lsp_expand(args.body)
--            require('snippy').expand_snippet(args.body)
--            vim.fn["UltiSnips#Anon"](args.body)
--        end,
--    },
--    mapping = {
--        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--        ['<C-f>'] = cmp.mapping.scroll_docs(4),
--        ['<C-Space>'] = cmp.mapping.complete(),
--        ['<C-e>'] = cmp.mapping.close(),
--        ['<CR>'] = cmp.mapping.confirm({
--            behavior = cmp.ConfirmBehavior.Replace,
--            select = true,
--        }),
--    },
--    window = {
--        completion = cmp.config.window.bordered(),
--        documentation = cmp.config.window.bordered(),
--    },
--    sources = {
--        { name = 'nvim_lsp' },
--        { name = 'vsnip' },
--        { name = 'buffer' },
--        { name = 'path' },
--        { name = 'nvim_lua' },
--    },
--    formatting = {
--        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
--    },
--})
--
-- HTML LSP
--lspconfig.html.setup({
--    capabilities = capabilities,
--    on_attach = require('lsp_signature').on_attach,
--})

-- Neotree setup
--require("neo-tree").setup({
--    close_if_last_window = false,
--    popup_border_style = "rounded",
--    enable_git_status = true,
--    enable_diagnostics = true,
--})

-- Devicons
require("nvim-web-devicons").setup({
    default = true,
    color_icons = true,
    icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
        },
    git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "󰁕",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
})
-- NeoScroll
require('neoscroll').setup({})
-- Custom commands
vim.cmd([[
    command! Bulb lua require('utils.lua').switch()
    ]])
-- Telescope/fuzzy finder 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Discreet length marker 
vim.cmd('set colorcolumn=81')
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<BS>', '<Nop>', {noremap = true, silent = true})

-- Map the write file command to <leader> + s
vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', { noremap = true, silent = true })

require("nvim-surround").setup({})
-- Add path to include all files recursively
vim.o.path = vim.o.path .. ',**'

-- Define a command to generate tags using ctags
vim.cmd('command! MakeTags !ctags -R .')
-- Remap jk to act as Escape in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })
-- Leader remaps and aliases.
-- Overwrite the write command to update tags file if it exists
-- Add this line to your init.lua file in Neovim
vim.api.nvim_set_keymap('n', '<leader>l', ':ls<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<CR>', { noremap = true, silent = true })
vim.cmd([[
  augroup UpdateTagsOnWrite
    autocmd!
    autocmd BufWritePre * if filereadable(vim.o.tags) | silent! !ctags -R . | endif
  augroup END
]])
-- Coc related settings
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "yes"
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight column at position 121
vim.api.nvim_command('set colorcolumn=121')

-- Harpoon setup

local harpoon = require("harpoon")

harpoon:setup({})
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-M-n>", function() harpoon:list():next() end)
-- End of Harpoon setup

vim.keymap.set("n", "<h-\">", "")
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

vim.opt.list = true
vim.opt.listchars = {trail = '_', tab='>>'}

vim.opt.autoindent = true
vim.opt.expandtab = false 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
