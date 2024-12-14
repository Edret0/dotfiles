function P(...)
    vim.print(...)
end

function INSPECT_TABLE(...)
    print(vim.inspect(...))
end

RELOAD = function (...)
    package.loaded[...] = nil
    require(...)
end


