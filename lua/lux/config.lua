local config = {
  defaults = {
    variation = {
      ayu = true,
      teal = false,
      mono = false,
    },
    terminal = true,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
