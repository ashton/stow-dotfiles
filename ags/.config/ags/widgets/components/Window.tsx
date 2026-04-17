import { focusedClient } from "../../variables"
import { With } from "ags";

const windowName = focusedClient(client => client?.title)
export default () =>
  <With value={windowName}>
    {name => (
      <box
        visible={name != null}
        class="component active-window"
        spacing={5}>
        <image iconName="cs-windows" />
        <label label={name} />
      </box>
    )}
  </With>
