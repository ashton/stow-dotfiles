import { focusedClient } from "../../../variables"
import { createBinding, With } from "ags";

export default () =>
  <With value={focusedClient}>
    {client => {
      var bind = createBinding(client, "title");
      var title = bind(str => {
        if (str.length > 50)
          return `${str.slice(0, 50)}...`;

        return str;
      })

      return (
        <box
          visible={title != null}
          class="component active-window"
          spacing={5}>
          <image iconName="cs-windows" />
          <label label={title} />
        </box>
      )
    }}
  </With>
