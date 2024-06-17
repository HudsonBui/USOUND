import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/screens/main_screem/tab_screen/search/search_default.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
        const SizedBox(height: 20),
        const Expanded(
          child: SearchDefault(),
        )
      ],
    );
  }
}
