import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/widgets/list_songs/themed_playlist.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Library',
          style: textNormalStyle,
          textAlign: TextAlign.left,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          title: const Text(
            'Playlist',
            style: textSmallLightStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          title: const Text(
            'Albums',
            style: textSmallLightStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          title: const Text(
            'Following',
            style: textSmallLightStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          title: const Text(
            'Follower',
            style: textSmallLightStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {},
          title: const Text(
            'Your upload',
            style: textSmallLightStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        const SizedBox(height: 20),
        const ThemedPlaylist(title: 'Listening history'),
      ],
    );
  }
}
