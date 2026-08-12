local utils = require("conf.utils.bindings")
local default_apps = require("conf.utils.default_applications")
local main_mod = utils.main_mod_bind
local exec = utils.exec_with_uwsm

main_mod("SPACE", exec(default_apps.launcher.start_command), { description = "App Launcher" })
main_mod("RETURN", exec(default_apps.terminal.start_command), { description = "New terminal window" })
main_mod("C", hl.dsp.exec_cmd(default_apps.dmenu.clipboard_command), { description = "Clipboard history" })
main_mod("E", hl.dsp.exec_cmd(default_apps.dmenu.emoji_command), { description = "Emoji picker" })
main_mod("Q", hl.dsp.window.close(), { description = "Close focused window" })
main_mod("ESCAPE", hl.dsp.exec_cmd("loginctl terminate-user \"\""), { description = "Logout" })
main_mod("F", exec(default_apps.file_manager.start_command), { description = "File Manager" })
main_mod("Y", exec("yazi"), { description = "Yazi" })
hl.bind("CTRL + SPACE", exec(default_apps.launcher.start_command), { description = "App Launcher" })
hl.bind("SUPER + F5", exec(default_apps.terminal.execute_command("herdr")),
  { description = "Herdr (Terminal Multiplexer)" })

-- Focus bindings
main_mod("B", hl.dsp.focus({ window = "class:zen" }), { description = " Focus Zen Browser" })
main_mod("T", function()
  local window = hl.get_windows({ tag = "code*" })[1]
  if window ~= nil then
    hl.dispatch(hl.dsp.focus({ window = string.format("pid:%s", window.pid) }))
  end
end, { description = " Focus Terminal for coding" })
