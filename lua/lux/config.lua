local config = {
  defaults = {
    teal = false,
    terminal = true,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
