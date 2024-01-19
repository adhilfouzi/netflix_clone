import 'package:flutter/material.dart';
import '../../../constants/colors/common_colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/font.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    height: 70,
                    width: 120,
                    child: Image.network(
                        '${Constants.imagePath}${snapshot.data![index].backdropPath}',
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      '${snapshot.data![index].title}',
                      style: titleTextStyle,
                      maxLines: 1,
                    )),
                const CircleAvatar(
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      color: titleColor,
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: snapshot.data.length),
    );
  }
}
