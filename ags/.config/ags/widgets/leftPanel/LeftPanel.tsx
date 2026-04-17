import { Gtk } from "ags/gtk4";
import OutdatedPackages from "../components/OutdatedPackages";
import MenuButton from "../components/MenuButton";
import Workspaces from "../components/Workspaces";
import Window from "../components/Window";

export default () => {
  return (
    <box class="left-panel" spacing={10} halign={Gtk.Align.START}>
      <MenuButton />
      <OutdatedPackages />
      <Workspaces />
      <Window />
    </box>
  );
}
