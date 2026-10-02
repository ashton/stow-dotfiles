local utils = require("conf.utils.bindings")
local default_apps = require("conf.utils.default_applications")
local main_mod = utils.main_mod_bind

main_mod("equal", hl.dsp.exec_cmd(default_apps.screenshot.start_command))
