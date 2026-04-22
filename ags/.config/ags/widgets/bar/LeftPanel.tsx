import { Gtk } from "ags/gtk4";
import { CurrentWindow, SystemMenu, OutdatedPackages, Workspaces } from "../components/bar";

export default () => {
  return (
    <box class="left-panel" spacing={10} halign={Gtk.Align.START}>
      <SystemMenu />
      <OutdatedPackages />
      <Workspaces />
      <CurrentWindow />
    </box>
  );
}
