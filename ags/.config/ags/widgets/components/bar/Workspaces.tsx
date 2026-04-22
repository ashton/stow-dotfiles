import AstalHyprland from "gi://AstalHyprland?version=0.1";
import { Accessor, For } from "ags";
import { workspaces, focusedWorkspace, globalSettings } from "../../../variables";
import * as wsService from "../../../services/workspace";

const orderedWorkspaces = workspaces((list: AstalHyprland.Workspace[]) =>
  list
    .filter(ws => !wsService.isSpecial(ws))
    .toSorted((ws1: AstalHyprland.Workspace, ws2: AstalHyprland.Workspace) => {
      if (ws1.id > ws2.id) {
        return 1;
      } else if (ws2.id > ws1.id) {
        return -1;
      } else {
        return 0;
      }
    }))

export default () =>
  <box class="component workspaces" spacing={5}>
    <For each={orderedWorkspaces}>
      {(ws: AstalHyprland.Workspace, _) => {
        return (
          <label
            class={focusedWorkspace(focusedWs => focusedWs.id == ws.id ? "active" : "")}
            label={globalSettings().workspaces.workspaceNameToIcon[ws.name]}
            tooltipText={globalSettings().workspaces.workspaceNameToDescription[ws.name]}
          />
        )
      }}
    </For>
  </box>
