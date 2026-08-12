local function main_mod_bind(key, dispatcher, options)
  options = options or {}
  hl.bind("CTRL + ALT + SUPER +" .. key, dispatcher, options)
end

local function exec_with_uwsm(args)
  return hl.dsp.exec_cmd("uwsm app -- " .. args)
end

return {
  main_mod_bind = main_mod_bind,
  exec_with_uwsm = exec_with_uwsm,
  mouse_buttons = {
    left = "mouse:272",
    right = "mouse:273",
    middle = "mouse:274",
    side_right = "mouse:275",
    side_left = "mouse:276"
  }
}
