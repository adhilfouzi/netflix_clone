import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/colors/common_colors.dart';

AppBar appbarHomepage(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          width: 50,
          height: 40,
          child: Image.asset(
            'assets/netflix_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Spacer(),
      IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search, color: titleColor))
    ],
  );
}
