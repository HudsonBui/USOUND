import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/widgets/song_item/song_no_style.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: hintTextColor,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: const [
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
              SongNoBackground(),
            ],
          ),
        )
      ],
    );
  }
}
