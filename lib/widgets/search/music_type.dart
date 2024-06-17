import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';

class BoxMusicTypeContainer extends StatelessWidget {
  const BoxMusicTypeContainer(this.name, this.color, {super.key});
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: color,
        elevation: 5,
        shadowColor: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: textNormalStyle,
          ),
        ),
      ),
    );
  }
}
