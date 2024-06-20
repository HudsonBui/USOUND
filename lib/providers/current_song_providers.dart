import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usound/models/current_song_model.dart';

final class CurrentSongProvider extends StateNotifier<CurrentSong> {
  CurrentSongProvider()
      : super(CurrentSong(
          trackId: '',
          trackName: '',
          trackImage: '',
          trackUrl: '',
          artistsName: '',
          playlistId: '',
          duration: Duration(minutes: 3, seconds: 30),
          position: Duration(minutes: 1, seconds: 30),
        ));
  //Todo: fetch the current song from the server and assign to the constructor?
  void setCurrentSong(CurrentSong song) {
    state = song;
  }

  void updatePosition(Duration position) {
    state = state.updatePosition(position);
  }
}

final currentSongProvider = StateNotifierProvider<CurrentSongProvider, CurrentSong>((ref) {
  return CurrentSongProvider(); //return current song information
});
