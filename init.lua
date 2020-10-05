local log = {}

log.env_var = 'LUA_LOGALOT_DOMAINS'
log.default_domains = {}

local cached_domains

local function domains(domain)
    if not cached_domains then
        local var = os.getenv(log.env_var)
        if var then
            cached_domains = {}
            for d in string.gmatch(var, '([^,]+)') do
                cached_domains[d] = true
            end
            if cached_domains['all'] then
                cached_domains = true
            end
        else
            cached_domains = log.default_domains
        end
    end
    return cached_domains == true or cached_domains[domain] ~= nil
end

local function stderr(domain, msg, ...)
    local s = string.format('[%s] %s\n', domain, msg)
    io.stderr:write(string.format(s, ...))
end

setmetatable(log, {
    __call = function (_, msg, ...)
        print(string.format(msg, ...))
    end,
    __index = function (_, d)
        return function (...)
            if domains(d) then
                stderr(d, ...)
            end
        end
    end,
})

function log.warn(...)
    stderr('warn', ...)
end

function log.error(...)
    stderr('error', ...)
end

return log
