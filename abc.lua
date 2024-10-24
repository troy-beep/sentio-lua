function hexencode(str)
    return (str:gsub(".", function(char) return string.format("%02x", char:byte()) end))
end

function hexdecode(hex)
    return (hex:gsub("%x%x", function(digits) return string.char(tonumber(digits, 16)) end))
end

function isValidVersion(variant)
    return variant:match("^%d+%.%d+%.%d+$")
end

function isValidPackageName(name)
    return name:match("^[a-zA-Z0-9%-_]+$")
end

function isValidVendor(name)
    return name:match("^@%w+$")
end
