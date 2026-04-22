import Clock from "../components/Clock";
import Network from "../components/Network";
import Notifications from "../components/Notifications";
import SysTray from "../components/SysTray";
import Volume from "../components/Volume";

export default () =>
  <box class="center-panel" spacing={5}>
    <Volume />
    <Network />
    <Clock />
    <SysTray />
    <Notifications />
  </box>
