import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';
import 'package:usound/models/current_song_model.dart';
import 'package:usound/providers/current_song_providers.dart';
import 'package:usound/repository/spotify_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongNoBackground extends ConsumerWidget {
  const SongNoBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyService = SpotifyService();
    return InkWell(
      onTap: () async {
        final track =
            await spotifyService.getTrackInfo('3Dv1eDb0MEgF93GpLXlucZ');
        print(track.getSongName());
        var songName = track.getSongName();
        var songUrl = await spotifyService.getTrackURL(songName);
        print(songUrl);
        //var currentSongInfor = CurrentSong(songId: track.songId, duration: Duration(), position: position, songName: songName, songImage: track.getImageUrl(), artistName: track.getArtistName(), playlistId: '');
        //var currentSong = ref.read(currentSongProvider.notifier).setCurrentSong(track);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  introScreen1Image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Song\'s name',
                    style: textNormalStyle,
                  ),
                  const Text(
                    'Artist',
                    style: textSmallLightStyle,
                  ),
                  const Text(
                    'Duration 1:34',
                    style: textSmallLightStyle,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
