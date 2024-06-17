import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget(
      {required this.subTitle,
      required this.title,
      required this.imageUrl,
      super.key});
  String subTitle;
  String title;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Card(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias, //Set ảnh thành hình tròn
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: textMediumStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          subTitle,
          style: textNormalStyle,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    );
  }
}
