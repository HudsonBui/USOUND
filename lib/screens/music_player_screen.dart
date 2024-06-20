import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:spotify/spotify.dart' as spotify;
//import 'package:flutter/src/widgets/image.dart' as image;
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/models/current_song_model.dart';
import 'package:usound/providers/current_song_providers.dart';
import 'package:usound/repository/spotify_services.dart';

class MusicPlayer extends ConsumerStatefulWidget {
  const MusicPlayer({super.key});

  @override
  ConsumerState<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends ConsumerState<MusicPlayer> {
  var playState = true; //true: playing, false: pause
  var repeatState = 1; //1: repeat off, 2: repeat one, 3: repeat all
  late Icon repeatIconState;
  var playIcon =
      const Icon(Icons.pause_circle, color: highContractColor, size: 60);

  final audioPlayer = AudioPlayer();
  var spotifyService = SpotifyService();

  late CurrentSong currentSong;
  var position;

  @override
  void initState() {
    super.initState();
    repeatIconState = _getRepeatIcon();
    // audioPlayer.setSource(UrlSource(audioUrl));
    // audioPlayer.play(UrlSource(audioUrl));
    // audioPlayer.resume(); //TODO: Improve the performance of loading the song
    currentSong = ref.read(currentSongProvider);
    _initSong();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _initSong() async {
    var timer = Stopwatch()..start();
    var trackUrl = currentSong.trackUrl;
    print(trackUrl);
    audioPlayer.setUrl(trackUrl.toString());
    audioPlayer.play();
    print('Time taken: ${timer.elapsed}');
  }

  void _changeRepeatState() {
    setState(() {
      repeatState++;
      if (repeatState > 3) repeatState = 1;
      repeatIconState = _getRepeatIcon();
    });
  }

  Icon _getRepeatIcon() {
    switch (repeatState) {
      case 1:
        return const Icon(Icons.repeat);
      case 2:
        return const Icon(Icons.repeat_one);
      case 3:
        return const Icon(
          Icons.repeat,
          color: highContractColor,
        );
      default:
        return const Icon(Icons.repeat);
    }
  }

  void _playController() async {
    setState(() {
      playState = !playState;
      if (playState) {
        playIcon =
            const Icon(Icons.pause_circle, color: highContractColor, size: 60);
        audioPlayer.play();
      } else {
        playIcon =
            const Icon(Icons.play_circle, color: highContractColor, size: 60);
        audioPlayer.pause();
        ref.read(currentSongProvider.notifier).updatePosition(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Playing now',
            style: textNormalStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          backgroundColor: solidBackgroundColor,
          centerTitle: true,
        ),
        body: Container(
          color: solidBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 350, // set the desired width
                          height: 400, // set the desired height
                          child: Image.network(
                            currentSong.trackImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ), //5 parts
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  currentSong.trackName,
                                  style: textMediumStyle,
                                ),
                                Text(
                                  currentSong.artistsName,
                                  style: textSmallLightStyle,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 8,
                        //   child: SliderTheme(
                        //     data: SliderThemeData(
                        //       //thumbShape: SliderComponentShape.noOverlay,
                        //       thumbColor: subtitleColor,
                        //       trackHeight: 8, // set the desired track height
                        //       overlayShape: SliderComponentShape.noOverlay,
                        //       overlayColor: Colors.transparent,
                        //       activeTrackColor: subtitleColor,
                        //       inactiveTrackColor: Colors.transparent,
                        //       activeTickMarkColor: Colors.transparent,
                        //       inactiveTickMarkColor: Colors.transparent,
                        //     ),
                        //     child: Slider(
                        //       min: 0,
                        //       max: 1000,
                        //       value: 600,
                        //       onChanged: (value) {},
                        //     ),
                        //   ),
                        // ),
                        StreamBuilder<Duration>(
                            stream: audioPlayer.positionStream,
                            builder: (context, snapshot) {
                              position = snapshot.data;
                              return ProgressBar(
                                barHeight: 8,
                                progress: (snapshot.data as Duration),
                                //buffered: Duration(milliseconds: 120000),
                                total: currentSong.duration,
                                //bufferedBarColor: Colors.white30,
                                progressBarColor: highContractColor,
                                thumbColor: highContractColor,
                                baseBarColor:
                                    const Color.fromARGB(60, 102, 92, 92),
                                timeLabelTextStyle:
                                    const TextStyle(color: Colors.white),
                                onSeek: (duration) {
                                  audioPlayer.seek(duration);
                                },
                              );
                            }),
                      ],
                    ),
                  ), //1 part
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _changeRepeatState,
                          icon: repeatIconState, // repeat_one, repeat_on
                          iconSize: 26,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous),
                          iconSize: 36,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: _playController,
                          icon: playIcon,
                          iconSize: 60,
                          color: highContractColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next),
                          iconSize: 36,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.queue_music_sharp),
                          iconSize: 26,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ), //1 part
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
