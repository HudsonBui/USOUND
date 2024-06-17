import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';

class PersonalInforScreen extends StatelessWidget {
  const PersonalInforScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      introScreen2Image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Hudson Bui',
                  style: textMediumStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Personal Information',
            style: textNormalStyle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            title: const Text(
              'Personal Informantion',
              style: textSmallLightStyle,
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            title: const Text(
              'Change password',
              style: textSmallLightStyle,
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            title: Row(
              children: [
                Text(
                  'Log out',
                  style: textSmallLightStyle.copyWith(color: Colors.redAccent),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.exit_to_app,
                  color: Colors.redAccent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
