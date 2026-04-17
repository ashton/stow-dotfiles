import AstalHyprland from "gi://AstalHyprland?version=0.1"

export const isSpecial = (ws: AstalHyprland.Workspace) =>
  ws.name.startsWith('special')
