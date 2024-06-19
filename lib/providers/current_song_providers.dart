import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usound/models/current_song_model.dart';

final class CurrentSongProvider extends StateNotifier<CurrentSong> {
  CurrentSongProvider()
      : super(CurrentSong(
          songId: '',
          songName: '',
          songImage: '',
          artistName: '',
          playlistId: '',
          duration: Duration(minutes: 3, seconds: 30),
          position: Duration(minutes: 1, seconds: 30),
        ));

  void setCurrentSong(CurrentSong song) {
    state = song;
  }
}

final currentSongProvider = StateNotifierProvider<CurrentSongProvider, CurrentSong>((ref) {
  return CurrentSongProvider(); //return current song information
});
