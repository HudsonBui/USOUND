import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';

class SongTrackCard extends StatelessWidget {
  const SongTrackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
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
                      style:
                          textSmallStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Artist',
                      style: textExtraSmallLightStyle,
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle))
            ],
          ),
          //Seekbar for the song
          SizedBox(
            width: double.infinity,
            height: 8,
            child: SliderTheme(
              data: SliderThemeData(
                thumbShape: SliderComponentShape.noThumb,
              ),
              child: Slider(
                min: 0,
                max: 1000,
                value: 200,
                onChanged: (value) {},
                activeColor: subtitleColor,
                inactiveColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
