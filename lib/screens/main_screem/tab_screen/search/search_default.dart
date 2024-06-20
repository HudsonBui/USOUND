import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/repository/spotify_services.dart';
import 'package:usound/widgets/search/music_type.dart';

class SearchDefault extends StatelessWidget {
  const SearchDefault({super.key});

  @override
  Widget build(BuildContext context) {

    var spotifyService = SpotifyService();
    
    List<String> musicType;

    void getMusicType() async {
      musicType = await spotifyService.getAvailableGenre();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          BoxMusicTypeContainer('K-Pop', Colors.red.shade400),
          BoxMusicTypeContainer('Hip hop', Colors.purple.shade400),
          BoxMusicTypeContainer('Blues', Colors.blueAccent.shade400),
          BoxMusicTypeContainer('Folk', Colors.yellow.shade300),
          BoxMusicTypeContainer('K-Pop', Colors.red.shade400),
          BoxMusicTypeContainer('Hip hop', Colors.purple.shade400),
          BoxMusicTypeContainer('Blues', Colors.blueAccent.shade400),
          BoxMusicTypeContainer('Folk', Colors.yellow.shade300),
          BoxMusicTypeContainer('K-Pop', Colors.red.shade400),
          BoxMusicTypeContainer('Hip hop', Colors.purple.shade400),
          BoxMusicTypeContainer('Blues', Colors.blueAccent.shade400),
          BoxMusicTypeContainer('Folk', Colors.yellow.shade300),
        ],
      ),
    );
  }
}
