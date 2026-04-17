import App from "ags/gtk4/app";
import { Astal, Gdk } from "ags/gtk4";
import { getMonitorName } from "../../utils/monitor";
import { emptyWorkspace, fullscreenClient, globalMargin } from "../../variables";
import LeftPanel from "../leftPanel/LeftPanel";
import CenterPanel from "../centerPanel/CenterPanel";
import RightPanel from "../rightPanel/RightPanel";

export default (monitor: Gdk.Monitor) => {
  const monitorName = getMonitorName(monitor);
  (
    <window
      gdkmonitor={monitor}
      name={`bar-${monitorName}`}
      namespace="bar"
      class="Bar"
      application={App}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
      marginTop={globalMargin}
      marginRight={globalMargin}
      marginLeft={globalMargin}
      visible={fullscreenClient((val) => !val)}>
      <box spacing={5} class={emptyWorkspace((val) => val ? "bar empty" : "bar full")}>
        <box class="bar-center" hexpand>
          <centerbox hexpand>
            <LeftPanel $type="start" />
            <CenterPanel $type="center" />
            <RightPanel $type="end" />
          </centerbox>
        </box>
      </box>
    </window>
  )
}


