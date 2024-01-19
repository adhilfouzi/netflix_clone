import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import '../../../../../constants/colors/common_colors.dart';

class MainTileCardSeries extends StatelessWidget {
  const MainTileCardSeries({
    Key? key,
    required this.title,
    required this.snapshot,
  }) : super(key: key);

  final String title;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: titleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data![index].posterPathTv}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
