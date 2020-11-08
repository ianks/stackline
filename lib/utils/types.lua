function utils.boolToNum(value)
    return value == true and 1 or value == false and 0
end

function utils.isarray(x)
    return type(x) == "table" and x[1] ~= nil
end

function utils.toBool(val)
    -- Reference:
    -- function u.toBool( v )
    --   local n = tonumber( v )
    --   return n ~= nil and n ~= 0
    -- end
    local t = type(val)
    if t == 'boolean' then
        return val
    elseif t == 'number' then
        return val == 1 and true or false
    elseif t == 'string' then
        val = val:gsub("%W", "") -- remove all whitespace
        local TRUE = {
            ['1'] = true,
            ['t'] = true,
            ['T'] = true,
            ['true'] = true,
            ['TRUE'] = true,
            ['True'] = true,
        };
        local FALSE = {
            ['0'] = false,
            ['f'] = false,
            ['F'] = false,
            ['false'] = false,
            ['FALSE'] = false,
            ['False'] = false,
        };
        if TRUE[val] == true then
            return true;
        elseif FALSE[val] == false then
            return false;
        else
            return false, string.format('cannot convert %q to boolean', val);
        end
    end
end

