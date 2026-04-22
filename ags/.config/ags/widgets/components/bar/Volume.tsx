import { Accessor, createComputed, createState } from "ags";
import AstalWp from "gi://AstalWp?version=0.1"

const wireplumber = AstalWp.get_default();
const audio = wireplumber?.audio;

const [description, setDescription] = createState("");
const [volume, setVolume] = createState(0);
const [isMute, setMuteValue] = createState(false);

const volumeValue = volume(val => Math.round(val * 100));
const volumeText = createComputed(() => {
  if (isMute())
    return "";

  return `${volumeValue()}%`;
})
const volumeIcon = createComputed(() => {
  if (isMute())
    return "audio-volume-muted";

  if (volumeValue() >= 1 && volumeValue() < 34)
    return "audio-volume-low";

  if (volumeValue() >= 34 && volumeValue() < 66)
    return "audio-volume-medium";

  return "audio-volume-high";
})

audio.connect('speaker-added', (_, speaker) => {
  if (speaker.isDefault) {
    setDescription(speaker.description);
    setVolume(speaker.volume);
    setMuteValue(speaker.mute);
  }
})

const VolumeIcon = () => {
  return (
    <image iconName={volumeIcon} />
  )
}

const VolumeLabel = () =>
  <label label={volumeText} />

export default () =>
  <button class="component volume" tooltipText={description}>
    <box spacing={5}>
      <VolumeIcon />
      <VolumeLabel />
    </box>
  </button>

