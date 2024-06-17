import 'package:flutter/material.dart';
import 'package:usound/widgets/song_item/song_large.dart';

class HorizontalListSong extends StatelessWidget {
  const HorizontalListSong({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const SongItemLarge(),
    );
  }
}
