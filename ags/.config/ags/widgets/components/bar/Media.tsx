import { createState } from "ags";
import AstalMpris from "gi://AstalMpris?version=0.1"
import * as mediaPlayerService from '../../../services/media/mediaPlayer';
import * as mediaService from '../../../services/media/media'
import { MediaPlayer } from "../../../services/media/types";
import GLib from "gi://GLib?version=2.0";

const mprisService = AstalMpris.get_default();
const [activePlayer, setActivePlayer] = createState<MediaPlayer>(undefined);
const [currentMetadata, setCurrentMetadata] = createState<GLib.Variant>(GLib.Variant.new('a{sv}', {}));

mprisService.connect('player-added', (_: any, player: AstalMpris.Player) => {
  if (activePlayer.peek() === undefined) {
    setActivePlayer(player);
    setCurrentMetadata(player.metadata)
  }
});

mprisService.connect('player-closed', (_: any, player: AstalMpris.Player) => {
  if (activePlayer.peek() === player) {
    const remaining = mprisService.get_players().filter((p: AstalMpris.Player) => p !== player);
    setActivePlayer(remaining[0]);
    setCurrentMetadata(remaining[0]?.metadata ?? GLib.Variant.new('a{sv}', {}))
  }
});

const playerName = activePlayer(player => mediaPlayerService.getName(player));
const iconName = playerName(player => player ?? 'music')
const media = currentMetadata(metadata => mediaService.getMedia(metadata));
const label = media(media => (media?.album.artist && media?.track.title) ? `${media?.album.artist} - ${media?.track.title}` : "Media");


export default () => {
  return (
    <box class="component media">
      <image iconName={iconName} />
      <button label={label}>

      </button>
    </box>
  )
}
