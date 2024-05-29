local theme = {}

function theme.switch()
    if vim.o.background == 'light' then
        vim.o.background = 'dark'
    else 
        vim.o.background = 'light'
    end

    vim.cmd('colorscheme melange')
end

return theme
