import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../../../constants/constants.dart';

class DownloadImages extends StatelessWidget {
  const DownloadImages({
    super.key,
    required this.screenSizeWidth,
    required this.screenSizeHeight,
    required this.angle,
    required this.margin,
    required this.snapshot,
    required this.index,
  });

  final AsyncSnapshot snapshot;
  final double screenSizeWidth;
  final double screenSizeHeight;
  final double angle;
  final EdgeInsets margin;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          margin: margin,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: screenSizeWidth,
          height: screenSizeHeight,
          child: Image.network(
            '${Constants.imagePath}${snapshot.data![index].posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
