import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/widgets/song_item/song.dart';

class ThemedPlaylist extends StatelessWidget {
  const ThemedPlaylist({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: textNormalStyle),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: textSmallLightStyle,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const SongItem(),
          const SizedBox(height: 10),
          const SongItem(),
          const SizedBox(height: 10),
          const SongItem()
        ],
      ),
    );
  }
}
