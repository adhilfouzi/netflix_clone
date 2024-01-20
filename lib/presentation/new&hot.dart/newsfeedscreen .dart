import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/constants/colors/common_colors.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/constants/font.dart';
import 'package:netflix_clone/models/movie.dart';

class CombinedScreen extends StatefulWidget {
  const CombinedScreen({
    super.key,
  });

  @override
  State<CombinedScreen> createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  late Future<List<Movie>> trendingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getnowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: trendingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'New and Hot',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.cast),
                  onPressed: () {
                    // Implement search functionality
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String date = snapshot.data![index].releaseDate;
                        List<String> dateParts = date.split('-');
                        final DateTime dateSplit = DateTime.parse(date);
                        final month = DateFormat('MMM').format(dateSplit);
                        //    final day = DateFormat('EEEE').format(dateSplit);
                        //     final size = MediaQuery.of(context).size;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      month,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      dateParts[2].toString(),
                                      style: const TextStyle(
                                          color: titleColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Card(
                                  surfaceTintColor: Colors.black87,
                                  color: Colors.black87,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: SizedBox(
                                                height: 180,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Image.network(
                                                  '${Constants.imagePath}${snapshot.data![index].backdropPath}',
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Spacer(),
                                                Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.notifications,
                                                        color: titleColor,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Remind Me",
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.info_outline,
                                                        color: titleColor,
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Info',
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              snapshot.data![index].title,
                                              style: const TextStyle(
                                                  color: titleColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              snapshot.data![index].overview,
                                              style: contentTextStyle,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
