local utils = require("conf.utils.bindings")
local default_apps = require("conf.utils.default_applications")
local main_mod = utils.main_mod_bind
local exec = utils.exec_with_uwsm

main_mod("SPACE", exec(default_apps.launcher.start_command))
main_mod("RETURN", exec(default_apps.terminal.start_command))
main_mod("C", hl.dsp.exec_cmd(default_apps.dmenu.clipboard_command))
main_mod("E", hl.dsp.exec_cmd(default_apps.dmenu.emoji_command))
main_mod("Q", hl.dsp.window.close())
main_mod("ESCAPE", hl.dsp.exec_cmd("loginctl terminate-user \"\""))
main_mod("F", exec(default_apps.file_manager.start_command))
main_mod("Y", exec("yazi"))
main_mod("B", exec(default_apps.browser.start_command))
hl.bind("CTRL + SPACE", exec(default_apps.launcher.start_command))
hl.bind("SUPER + F5", exec(default_apps.terminal.execute_command("herdr")))
