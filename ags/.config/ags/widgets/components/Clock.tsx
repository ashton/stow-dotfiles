import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"


const dateTime = createPoll(
  GLib.DateTime.new_now_local(),
  1000,
  () => GLib.DateTime.new_now_local()
);

const label = dateTime(dt => dt.format("%d/%m/%Y[%a] %H:%M") ?? "")

export default () =>
  <box visible={label() !== ""} spacing={5} class="component clock">
    <image iconName="clock" />
    <label label={label} />
  </box>
