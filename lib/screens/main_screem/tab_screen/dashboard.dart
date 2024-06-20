import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/widgets/list_songs/horizontal_list_song.dart';
import 'package:usound/widgets/list_songs/themed_playlist.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Hudson,',
                        style: textNormalStyle,
                      ),
                      Text(
                        'What do you want to hear to day?',
                        style: textSmallStyle,
                      ),
                    ],
                  ),
                  // IconButton.outlined(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.music_note_rounded),
                  // )
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      TabBar(
                        //padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        indicatorColor: subtitleColor,
                        dividerColor: Colors.transparent,
                        labelColor: subtitleColor, // Màu của tab được chọn
                        unselectedLabelColor: Colors.white,
                        tabAlignment: TabAlignment.start,
                        tabs: [
                          Tab(
                            child: Text(
                              'Recommendation',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Tab 2',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Tab 3',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Tab 3 second',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Tab 3 third',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          children: [
                            HorizontalListSong(),
                            HorizontalListSong(),
                            HorizontalListSong(),
                            HorizontalListSong(),
                            HorizontalListSong(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ThemedPlaylist(title: 'More what you like'),
              const SizedBox(height: 20),
              const ThemedPlaylist(title: 'Made for Hudson'),
              const SizedBox(height: 20),
              const ThemedPlaylist(title: 'Chill'),
            ],
          ),
        ],
      ),
    );
  }
}
