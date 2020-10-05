# lua-logalot

lua-logalot is a simple domain-based logging library for lua.

## Installation

```
$ git clone https://github.com/jcrd/lua-logalot.git
$ cd lua-logalot
$ luarocks make --local rockspec/logalot-devel-1.rockspec
```

## Usage

Set up the `LUA_LOGALOT_DOMAINS` environment variable:

```sh
export LUA_LOGALOT_DOMAINS=domain1,domain2
```

Use in lua:

```lua
log = require('logalot')

log('log to stdout')
log.warn('log warning to stderr')
log.error('log error to stderr')
-- The following will only print if the domain appears in the
-- LUA_LOGALOT_DOMAINS environment variable.
log.domain1('log to a custom domain')
```

## License

This project is licensed under the MIT License (see [LICENSE](LICENSE)).
