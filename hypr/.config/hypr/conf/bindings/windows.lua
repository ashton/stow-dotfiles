local default_apps = require("conf.utils.default_applications")
local utils = require("conf.utils.bindings")
local main_mod = utils.main_mod_bind
local mouse = utils.mouse_buttons

hl.define_submap("window_management", "reset", function()
  hl.bind("SPACE", hl.dsp.layout("focusmaster"))
  hl.bind("N", hl.dsp.layout("cyclenext"))
  hl.bind("P", hl.dsp.layout("cycleprev"))
  hl.bind("F", hl.dsp.window.float({ action = "toggle" }))
  hl.bind("M", hl.dsp.window.fullscreen({ action = "toggle" }))
  hl.bind("Return", hl.dsp.layout("swapwithmaster auto"))
  hl.bind("left", hl.dsp.layout("swapprev"))
  hl.bind("right", hl.dsp.layout("swapnext"))
  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + TAB", hl.dsp.exec_cmd(default_apps.dmenu.windows_command))
hl.bind("ALT + SHIFT + TAB", hl.dsp.layout("cycleprev"))
hl.bind("ALT + TAB", hl.dsp.layout("cyclenext"))
hl.bind("ALT + TAB", function()
  local special = hl.get_active_monitor().active_special_workspace
  if special and special.active then
    hl.dsp.workspace.toggle_special(special.name)
  end
end)

main_mod(mouse.left, hl.dsp.window.drag())
main_mod(mouse.right, hl.dsp.window.resize())

main_mod("W", hl.dsp.submap("window_management"))
main_mod("h", hl.dsp.focus({ direction = "left" }))
main_mod("l", hl.dsp.focus({ direction = "right" }))
main_mod("j", hl.dsp.focus({ direction = "down" }))
main_mod("k", hl.dsp.focus({ direction = "up" }))
