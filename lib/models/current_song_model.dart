enum RepeatMode { off, all, one }

enum PlayState { playing, paused }

class CurrentSong {
  final String trackId;
  final String trackName;
  final String trackImage;
  final String artistsName;
  final String playlistId;
  final Duration duration;
  final Duration position; //Current position of the song
  final String trackUrl;

  CurrentSong(
      {required this.trackId,
      required this.duration,
      required this.position,
      required this.trackName,
      required this.trackImage,
      required this.artistsName,
      required this.playlistId,
      required this.trackUrl});

  CurrentSong updatePosition(Duration position) {
    print('Position: $position');
    return CurrentSong(
        trackId: trackId,
        trackName: trackName,
        trackImage: trackImage,
        artistsName: artistsName,
        playlistId: playlistId,
        duration: duration,
        position: position,
        trackUrl: trackUrl);
    
  }
}
