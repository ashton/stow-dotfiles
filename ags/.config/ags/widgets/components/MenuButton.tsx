import { refreshCss } from "../../utils/scss";

export default () =>
  <button iconName="archlinux" tooltipText="Menu" class="arch-logo" onClicked={() => refreshCss()}></button>
