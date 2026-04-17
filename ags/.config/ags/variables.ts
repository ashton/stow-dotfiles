import { autoCreateSettings, settingsPath } from "./utils/settings";
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();
import { Accessor, createBinding, createState } from "ags";
import { writeJSONFile } from "./utils/json";
import { Settings } from "./interfaces/settings.interface";
import { defaultSettings } from "./constants/settings.constants";
import { notify } from "./utils/notification";
import AstalHyprland from "gi://AstalHyprland";

export const focusedClient = createBinding(hyprland, "focusedClient");
export const workspaces: Accessor<AstalHyprland.Workspace[]> = createBinding(hyprland, "workspaces");
export const focusedWorkspace: Accessor<AstalHyprland.Workspace> = createBinding(hyprland, "focusedWorkspace");
print(`Initializing workspaces with: ${workspaces.peek().map(ws => ws.get_name())}`);
export const fullscreenClient = focusedClient((client) => {
  if (!client) return false;
  return client.fullscreen === 2 || client.get_fullscreen?.() === 2;
});
export const emptyWorkspace = focusedClient((client) => !client);

export const globalMargin = emptyWorkspace((empty) => (empty ? 20 : 5));
export const globalTransition = 300;

const [globalSettings, _setGlobalSettings] =
  createState<Settings>(defaultSettings);

// Initialize settings after creating the state
autoCreateSettings(globalSettings.peek(), setGlobalSettings);

export function setGlobalSetting(keyChanged: string, value: any) {
  try {
    let o: any = globalSettings.peek();
    keyChanged
      .split(".")
      .reduce(
        (o, k, i, arr) => (o[k] = i === arr.length - 1 ? value : o[k] || {}),
        o,
      );

    _setGlobalSettings({ ...o });
    writeJSONFile(settingsPath, o);
  } catch (e) {
    print(`Error setting global setting ${keyChanged}: ${e}`);
    notify({
      summary: "Error",
      body: `Error setting global setting ${keyChanged}: ${e}`,
    });
  }
}

function setGlobalSettings(value: Settings) {
  _setGlobalSettings(value);
  writeJSONFile(settingsPath, value);
}
export { globalSettings, setGlobalSettings };

