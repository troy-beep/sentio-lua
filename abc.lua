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

-- token gating

Handlers.add(
    "Broadcast",
    { Action = "Broadcast" },
    function(m)
        if Balances[m.From] == nil or tonumber(Balances[m.From]) < 1 then
            print("UNAUTH REQ: " .. m.From)
            return
        end
        local type = m.Type or "Normal"
        print("Broadcasting message from " .. m.From .. ". Content: " .. m.Data)
        for i = 1, #Members, 1 do
            ao.send({
                Target = Members[i],
                Action = "Broadcasted",
                Broadcaster = m.From,
                Data = m.Data
            })
        end
    end
)
