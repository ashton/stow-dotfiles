import GLib from "gi://GLib?version=2.0";
import { Media, Track, Album } from "./types";

const getStr = (value: GLib.Variant | undefined) =>
  value?.get_string()?.at(0) as string | undefined ?? '';

export const getMedia = (metadata: GLib.Variant | undefined): Media => {
  if (metadata === undefined)
    return metadata;

  print(`Creating media from metadata: ${metadata.print(true)}`)
  const track: Track = {
    id: getStr(metadata.lookup_value('mpris:trackid', null)),
    number: metadata.lookup_value('xesam:trackNumber', null)?.get_int32().toString(),
    title: getStr(metadata.lookup_value('xesam:title', null)),
    url: getStr(metadata.lookup_value('xesam:url', null)),
    length: metadata.lookup_value('mpris:length', null)?.get_uint64(),
  };

  const album: Album = {
    name: getStr(metadata.lookup_value('xesam:album', null)),
    artist: metadata.lookup_value('xesam:artist', null)?.get_strv()[0],
  }
  const artUrl = getStr(metadata.lookup_value('mpris:artUrl', null));

  return { track, album, image: artUrl };
}
