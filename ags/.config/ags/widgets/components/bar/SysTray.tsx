import { createBinding, For } from "ags";
import AstalTray from "gi://AstalTray?version=0.1";

const systemtray = AstalTray.get_default();

const items = createBinding(systemtray, "items");
const filteredItems = items(list => list.filter(item => item.title != "Network"))

export default () =>
  <box class="component systray">
    <For each={filteredItems}>
      {(item, _) => (
        <button>
          <image gicon={item.gicon} />
        </button>
      )}
    </For>
  </box>
