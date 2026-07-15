import { Gtk, Astal } from "ags/gtk4";
import App from "ags/gtk4/app";

export interface DropdownMenuProps {
  name: string;
  child?: JSX.Element | JSX.Element[]
  layout?: string;
  transition?: Gtk.RevealerTransitionType;
  exclusivity?: Astal.Exclusivity;
  fixed?: boolean;
  onDestroy?: () => void;
}

export default ({ name, child, exclusivity, transition, ...props }: DropdownMenuProps) =>
  <window
    name={name}
    namespace={name}
    class={`dropdown-menu-${name}`}
    visible={true}
    application={App}
    keymode={Astal.Keymode.ON_DEMAND}
    exclusivity={exclusivity}
    layer={Astal.Layer.TOP}
    anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT}
    {...props}
  >
    <box orientation={Gtk.Orientation.VERTICAL}>
      <box class="dropdown-menu-container">
        <revealer revealChild={false} transitionType={transition}>
          <box class="dropdown-content" halign={Gtk.Align.CENTER} vexpand canFocus>
            {child}
          </box>
        </revealer>
      </box>
    </box>
  </window>
