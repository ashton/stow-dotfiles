return {
  terminal = {
    name = "ghostty",
    start_command = "ghostty",
    execute_command = function(command)
      return "ghostty -e " .. command
    end
  },

  file_manager = {
    name = "thunar",
    start_command = "thunar"
  },

  browser = {
    name = "firefox",
    start_command = "firefox"
  },

  launcher = {
    name = "vicinae",
    start_command = "vicinae vicinae://toggle"
  },

  dmenu = {
    name = "vicinae",
    clipboard_command = "vicinae vicinae://launch/clipboard/history",
    emoji_command = "vicinae vicinae://launch/core/search-emojis",
    windows_command = "vicinae vicinae://launch/wm/switch-windows"
  }
}
