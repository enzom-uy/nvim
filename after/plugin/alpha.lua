local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  "Ash fell from the sky",
}
dashboard.section.buttons.val = {
  dashboard.button("; f", "Telescope"),
  dashboard.button("q", "Quit"),
}

local handle = io.popen "fortune"
local fortune = handle:read "*a"
handle:close()
dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.config)
