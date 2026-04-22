import { createState } from "ags";
import AstalHyprland from "gi://AstalHyprland?version=0.1"

const hyprland = AstalHyprland.get_default();
const [submap, setSubmap] = createState('');
const visible = submap(val => val != '');

hyprland.connect('submap', (_, submapName) => {
  setSubmap(submapName.replace('_', ' '));
});

export default () =>
  <box class="component submap" spacing={5} visible={visible}>
    <image iconName="keyboard-caps-locked" />
    <label label={submap} />
  </box>
