import { Clock, Network, Notifications, Systray, Volume } from "../components/bar";

export default () =>
  <box class="center-panel" spacing={5}>
    <Volume />
    <Network />
    <Clock />
    <Systray />
    <Notifications />
  </box>
