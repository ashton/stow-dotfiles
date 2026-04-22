import { MediaPlayer } from "./types";

export const getName = (player: MediaPlayer) =>
  player?.bus_name.replace("org.mpris.MediaPlayer2.", "");
