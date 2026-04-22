import AstalMpris from "gi://AstalMpris?version=0.1";

export type MediaPlayer = AstalMpris.Player | undefined;

export type Album = {
  artist: string;
  name: string;
}

export type Track = {
  id: string;
  number: string;
  title: string;
  url: string;
  length: number;
}

export type Media = {
  track: Track;
  album: Album;
  image: string;
} | undefined;
