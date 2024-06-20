class Song {
  final String trackId;
  final String trackName;
  final List<String> artistsId;
  final List<String> artistsName;
  final String albumId;
  final String trackImage;
  final Duration duration;

  Song({
    required this.trackId,
    required this.trackName,
    required this.artistsId,
    required this.artistsName,
    required this.albumId,
    required this.trackImage,
    required this.duration,
  });

  String getTrackName() {
    return trackName;
  }

  String getArtistsName() {
    return artistsName.join(', ');
  }

  String getImageUrl() {
    return trackImage;
  }

  String getAlbumId() {
    return albumId;
  }
  
  String getTrackId() {
    return trackId;
  }

  List<String> getArtistId() {
    List<String> artistIdList = [];
    for (var artist in artistsId) {
      artistIdList.add(artist);
    }
    return artistIdList;
  }
}