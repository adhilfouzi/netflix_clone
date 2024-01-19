import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors/common_colors.dart';

class AppbarDownloads extends StatelessWidget {
  const AppbarDownloads({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: titleColor, fontWeight: FontWeight.w900),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
