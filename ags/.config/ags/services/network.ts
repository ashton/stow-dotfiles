import AstalNetwork from "gi://AstalNetwork?version=0.1";
import { createBinding } from "ags";

type Device = AstalNetwork.Wired | AstalNetwork.Wifi;

export const iconName = (device: Device) =>
  createBinding(device, "iconName")
