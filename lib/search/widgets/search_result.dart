import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../models/search.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.searchMovies,
  });

  final Future<List<SearchMovie>> searchMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: FutureBuilder(
          future: searchMovies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error : ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else if (snapshot.hasData) {
              return GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                  childAspectRatio: 1 / 1.4,
                  shrinkWrap: true,
                  children: List.generate(snapshot.data!.length, (index) {
                    return MainCard(snapshot: snapshot, index: index);
                  })); 
            } else {
              return const SizedBox.shrink(); 
            }
          },
        )),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.snapshot, required this.index});
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (snapshot.data != null && index >= 0 && index < snapshot.data.length) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Image.network(
          '${Constants.imagePath}${snapshot.data[index].posterPath}',
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
