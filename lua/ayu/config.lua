local config = {
  defaults = {
    mirage = false,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
