import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart';
import 'package:usound/models/song.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SpotifyService {
  static final SpotifyService _instance = SpotifyService._internal();

  // Private internal constructor.
  SpotifyService._internal();

  // Public factory constructor.
  factory SpotifyService() {
    return _instance;
  }

  final String clientId =
      'd0d552f675f64f83b58f767a86877f55'; //TODO: Suppose to be secret
  final String clientSecret =
      '8d8d09d262d34832ac5a3146f22b9f0c'; //TODO: Suppose to be secret

  Future<String?> getAccessToken() async {
    final String credentials = '$clientId:$clientSecret';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    final url = Uri.parse('https://accounts.spotify.com/api/token');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final String accessToken = body['access_token'];
      return accessToken;
    } else {
      // Handle error or return null
      print('Failed to retrieve access token');
      return null;
    }
  }

  //SEARCH METHOD
  Future<void> search(String query,
      {String types = 'track,artist,album'}) async {
    final accessToken = await getAccessToken();
    if (accessToken == null) {
      return;
    }

    final url =
        Uri.parse('https://api.spotify.com/v1/search?q=$query&type=$types');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print(
          body); // This will print the entire response body which includes tracks, artists, and albums
    } else {
      // Handle error
      print('Failed to search on Spotify');
    }
  }

  //TRACK METHODS
  // Future<String> getTrackName(String trackId) async {
  //   final accessToken = await getAccessToken();
  //   if (accessToken == null) {
  //     return '';
  //   }

  //   final url = Uri.parse('https://api.spotify.com/v1/tracks/$trackId');
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Authorization': 'Bearer $accessToken',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final body = json.decode(response.body);
  //     // print(body);
  //     // print(body['name']);
  //     return body['name'];
  //   } else {
  //     // Handle error
  //     print('Failed to get track');
  //     return '';
  //   }
  // }
  Future<Song> getTrackInfo(String trackId) async {
    final credentials = SpotifyApiCredentials(clientId, clientSecret);
    final spotify = SpotifyApi(credentials);
    final track = await spotify.tracks.get(trackId);
    List<String> artistsId = [];
    List<String> artistsName = [];
    track.artists!.forEach((artist) {
      artistsId.add(artist.id!);
      artistsName.add(artist.name!);
    });

    return Song(
      songId: track.id!,
      songName: track.name!,
      artistId: [track.artists!.first.id!],
      artistName: artistsName,
      albumId: track.album!.id!,
      imageUrl: track.album!.images!.first.url!,
    );
  }

  Future<String> getTrackURL(String trackName) async {
    final yt = YoutubeExplode();
    final searchResults = await yt.search('$trackName lyrics');
    final videoId = searchResults.first.id.value;
    final manifest = await yt.videos.streamsClient.getManifest(videoId);
    final audioUrl = manifest.audioOnly.first.url;
    return audioUrl.toString();
  }
}
