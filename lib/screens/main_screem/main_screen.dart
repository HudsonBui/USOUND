import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/providers/current_song_providers.dart';
import 'package:usound/screens/main_screem/tab_screen/dashboard.dart';
import 'package:usound/screens/main_screem/tab_screen/favourite/favourite.dart';
import 'package:usound/screens/main_screem/tab_screen/library/library.dart';
import 'package:usound/screens/main_screem/tab_screen/personal/pers_info.dart';
import 'package:usound/screens/main_screem/tab_screen/search/search_screen.dart';
import 'package:usound/widgets/song_item/song_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  var currentSong;
  var _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      print('Vi tri: $index');
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentSong = ref.watch(currentSongProvider);
    Widget _activedScreen = const Dashboard();

    if (_selectedPageIndex == 1) {
      _activedScreen = const FavouriteScreen();
    }
    if (_selectedPageIndex == 2) {
      _activedScreen = const SearchScreen();
    }
    if (_selectedPageIndex == 3) {
      _activedScreen = const LibraryScreen();
    }
    if (_selectedPageIndex == 4) {
      _activedScreen = const PersonalInforScreen();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: solidBackgroundColor,
          ),
          child: _activedScreen,
        ),
      ),
      floatingActionButton: const SongTrackCard(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectedPage(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        backgroundColor: bottomNavigationBarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: subtitleColor,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
