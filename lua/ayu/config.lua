local config = {
  defaults = {
    mirage = false,
    terminal = true,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
