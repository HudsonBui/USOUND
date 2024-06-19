enum RepeatMode { off, all, one }

enum PlayState { playing, paused }

class CurrentSong {
  final String songId;
  final String songName;
  final String songImage;
  final String artistName;
  final String playlistId;
  final Duration duration;
  final Duration position; //Current position of the song

  CurrentSong(
      {required this.songId,
      required this.duration,
      required this.position,
      required this.songName,
      required this.songImage,
      required this.artistName,
      required this.playlistId});
}
