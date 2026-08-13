hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("TERMINAL", "ghostty")
hl.env("BEMENU_OPTS",
  "--fn \"JetBrainsMono NF 12\" --nb \"#1e1e2e\" --nf \"#cdd6f4\" --sb \"#89b4fa\" --sf \"#11111b\" --fb \"#1e1e2e\" --ff \"#cdd6f4\" --hf 26 --no-overlap true --width-factor 0.5 --center true --margin 50")
