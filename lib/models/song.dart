class Song {
  final String songId;
  final String songName;
  final List<String> artistId;
  final List<String> artistName;
  final String albumId;
  final String imageUrl;

  Song({
    required this.songId,
    required this.songName,
    required this.artistId,
    required this.artistName,
    required this.albumId,
    required this.imageUrl,
  });

  String getSongName() {
    return songName;
  }

  String getArtistName() {
    return artistName.join(', ');
  }

  String getImageUrl() {
    return imageUrl;
  }

  String getAlbumId() {
    return albumId;
  }
  
  String getSongId() {
    return songId;
  }

  String getArtistId() {
    return artistId.first;
  }
}