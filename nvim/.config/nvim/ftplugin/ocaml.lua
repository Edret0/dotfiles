vim.keymap.set('n', '<leader>db', function ()
    vim.cmd('!dune build')
end)

local function get_public_name()
    local handle = io.popen("cat bin/dune | grep '(public_name *' | awk '{print $2}' | tr -d ')'")
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "") -- Trim any whitespace
end

vim.keymap.set('n', '<leader>run', function ()
    local public_name = get_public_name()
    vim.cmd("!dune exec " .. public_name)
end)
