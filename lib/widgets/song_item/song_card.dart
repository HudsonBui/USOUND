import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';
import 'package:usound/screens/music_player_screen.dart';

class SongTrackCard extends StatefulWidget {
  const SongTrackCard({super.key});

  @override
  State<SongTrackCard> createState() => _SongTrackCardState();
}

class _SongTrackCardState extends State<SongTrackCard> {
  void _openMusicPlayerOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const MusicPlayer(),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openMusicPlayerOverlay,
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
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
                        style: textSmallStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Artist',
                        style: textExtraSmallLightStyle,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle),
                  iconSize: 40,
                )
              ],
            ),
            //Seekbar for the song
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: SliderTheme(
                data: SliderThemeData(
                  thumbShape: SliderComponentShape.noOverlay,
                  thumbColor: subtitleColor,
                  //trackHeight: 8, // set the desired track height
                  overlayShape: SliderComponentShape.noOverlay,
                  overlayColor: Colors.transparent,
                  activeTrackColor: subtitleColor,
                  inactiveTrackColor: Colors.transparent,
                  activeTickMarkColor: Colors.transparent,
                  inactiveTickMarkColor: Colors.transparent,
                ),
                child: Slider(
                  min: 0,
                  max: 1000,
                  value: 600,
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
