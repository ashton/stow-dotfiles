import { createState, With } from "ags";
import AstalNetwork from "gi://AstalNetwork?version=0.1";
import * as networkService from '../../../services/network';


const network = AstalNetwork.get_default();
const [primaryDevice, setPrimaryDevice] = createState<AstalNetwork.Wifi | AstalNetwork.Wired | undefined>(undefined)

if (network.primary === AstalNetwork.Primary.WIRED) {
  setPrimaryDevice(network.wired);
} else if (network.primary === AstalNetwork.Primary.WIFI) {
  setPrimaryDevice(network.wifi);
}

export default () =>
  <With value={primaryDevice}>
    {(device) => device && (
      <button class="component" iconName={networkService.iconName(device)}>
      </button>
    )}
  </With>
