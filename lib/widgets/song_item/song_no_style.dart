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
        var timer = Stopwatch()..start();
        var trackId = track.getTrackId();
        var trackName = track.getTrackName();
        var trackImage = track.getImageUrl();
        var artistsName = track.getArtistsName();
        var ytService = YoutubeService();
        var video = await ytService.setVideoResult(trackName);
        var trackUrl = await video.getAudioUrl();
        var trackDuration = video.getAudioDuration();
        var currentSongInfor = CurrentSong(
            trackId: trackId,
            trackName: trackName,
            trackImage: trackImage,
            trackUrl: trackUrl,
            duration: trackDuration,
            position: const Duration(minutes: 0, seconds: 0),
            artistsName: artistsName,
            playlistId: ''); //Todo: get the playlistId
        ref.read(currentSongProvider.notifier).setCurrentSong(currentSongInfor);
        print('Time taken: ${timer.elapsed}');
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
