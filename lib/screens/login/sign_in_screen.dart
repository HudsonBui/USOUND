import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';
import 'package:usound/widgets/sign_in_up/sign_in_widget.dart';
import 'package:usound/widgets/sign_in_up/sign_up_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var isSignIn = true;
  void _setIsSignIn() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //Form widget mình cần mình phải bao widget với một acestor widget như card, scaffold, drawner
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
              left: 24,
              top: size.height * 0.15,
              right: 24,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(signInBackgroundImage),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: backgroundLinearColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to USound!',
                  style: textMediumStyle.copyWith(color: subtitleColor),
                ),
                const SizedBox(height: 20),
                isSignIn
                    ? SignInWidget(isSignIn: _setIsSignIn)
                    : SignUpWidget(isSignIn: _setIsSignIn),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: textSmallStyle,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        googleLogoImage,
                        width: 35,
                        height: 35,
                      ),
                      Text(
                        'Sign in with Google',
                        style: textNormalStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
