import 'package:flutter/material.dart';
import 'package:usound/assets/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300.withOpacity(0.2),
      child: Center(
        child: SizedBox(
          height: 100,
          width: 150,
          child: Container(
              color: Colors.grey.shade400,
              child: Text('Loading...', style: textNormalStyle)),
        ),
      ),
    );
  }
}
