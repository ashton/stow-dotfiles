hl.window_rule({ name = "Logseq opens in special:notes", match = { class = "Logseq" }, workspace = "special:notes" })
hl.window_rule({
  name = "Floaty terminal opens in special:terminal",
  match = { class = "ghostty.floatty" },
  workspace =
  "special:terminal"
})
hl.window_rule({ name = "Browsers open in web workspace", match = { class = "^(firefox|zen)$" }, workspace = "name:web" })
hl.window_rule({ name = "Spotify opens in music workspace", match = { class = "Spotify" }, workspace = "name:music" })
hl.window_rule({ name = "Pinentry centered and floating", match = { class = "org.gnupg.pinentry-qt" }, float = true, center = true, pin = true, no_shadow = true, no_blur = true })

hl.window_rule({ name = "Add tag +code to ghostty in code workspace", match = { class = "com.mitchellh.ghostty", workspace = "name:code" }, tag =
"+code" })
