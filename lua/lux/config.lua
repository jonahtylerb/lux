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
  reset = function(config)
    config.variation = {
      ayu = false,
      teal = false,
      mono = false,
    }
  end,
}

setmetatable(config, { __index = config.defaults })

return config
