package = "logalot"
version = "devel-1"
source = {
    url = "git://github.com/jcrd/lua-logalot",
    tag = "master",
}
description = {
    summary = "Simple domain-based logging library",
    homepage = "https://github.com/jcrd/lua-logalot",
    license = "MIT",
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ["logalot"] = "init.lua",
    },
}
