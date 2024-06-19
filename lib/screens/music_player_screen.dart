import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:spotify/spotify.dart' as spotify;
//import 'package:flutter/src/widgets/image.dart' as image;
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  var playState = true; //true: playing, false: pause
  var repeatState = 1; //1: repeat off, 2: repeat one, 3: repeat all
  late Icon repeatIconState;
  var playIcon =
      const Icon(Icons.pause_circle, color: highContractColor, size: 60);
  final audioUrl =
      'https://rr7---sn-8pxuuxa-nbols.googlevideo.com/videoplayback?expire=1718840117&ei=1RZzZrL6D_2XvcAP3ve5iAU&ip=171.253.141.16&id=o-AJJDpDqByYs32LwKvfm98VWI3_YHspY5RfgHJCjxWcHQ&itag=139&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=oO&mm=31%2C29&mn=sn-8pxuuxa-nbols%2Csn-8pxuuxa-nbo6s&ms=au%2Crdu&mv=m&mvi=7&pl=21&initcwndbps=428750&vprv=1&svpuc=1&mime=audio%2Fmp4&rqh=1&gir=yes&clen=1432155&dur=234.660&lmt=1706662374291263&mt=1718818152&fvip=1&keepalive=yes&c=ANDROID_TESTSUITE&txp=4532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRAIgRrVAy8bO7YzmnPaJGuictAhXFVnG8gdFBoztj76xz8ACIFDL8liLOyf1PJ5if0fHHSOw18ZLFVrXvevL5_KpG4j0&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHlkHjAwRgIhAOCfXpLJECpZluraMFH4wePf7kOZLnkvnv_9ibra9IyvAiEAnaIKePPtfrM7iSJ_owDaQY41sOvSikqzHEUnTXQ-Auk%3D';
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    repeatIconState = _getRepeatIcon();
    // audioPlayer.setSource(UrlSource(audioUrl));
    // audioPlayer.play(UrlSource(audioUrl));
    // audioPlayer.resume(); //TODO: Improve the performance of loading the song
    audioPlayer.setUrl(audioUrl);
    audioPlayer.play();
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
                            'https://i.scdn.co/image/ab67616d00001e02f14aa81116510d3a6df8432b',
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
                                  'Song name',
                                  style: textNormalStyle,
                                ),
                                const Text(
                                  'Artist name',
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
                        ProgressBar(
                          barHeight: 8,
                          progress: const Duration(minutes: 1),
                          //buffered: Duration(milliseconds: 120000),
                          total: const Duration(minutes: 3, seconds: 30),
                          //bufferedBarColor: Colors.white30,
                          progressBarColor: highContractColor,
                          thumbColor: highContractColor,
                          baseBarColor: Colors.white24,
                          timeLabelTextStyle:
                              const TextStyle(color: Colors.white),
                          onSeek: (duration) {
                            print('User selected a new time: $duration');
                          },
                        ),
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
