import { createPoll } from "ags/time";

const pollingInterval = 30 * 60 * 1000 // 30 min * 60s * 1000 ms
const updatesAvailable = createPoll(
  0,
  pollingInterval,
  "/usr/share/hyprpanel/scripts/checkUpdates.sh -arch",
  (bashResult: string, _) => {
    print(`UpdateWidget poll result: ${bashResult}`);
    return parseInt(bashResult);
  }
);

const tooltipText = updatesAvailable((count: number) =>
  count > 0 ? `Updates available for ${count} packages` : "");

const visible = updatesAvailable((count: number) =>
  count > 0);

const label = updatesAvailable(value => `󰏔 ${value}`)

export default () =>
  <box
    class="component updates"
    tooltipText={tooltipText}
    spacing={0}
    visible={visible}>
    <label label={label} />
  </box>

