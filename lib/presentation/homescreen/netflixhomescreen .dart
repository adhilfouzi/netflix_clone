import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/constants/colors/common_colors.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/tv.dart';
import 'package:netflix_clone/presentation/homescreen/categories/movie/main_card_widget.dart';
import 'package:netflix_clone/presentation/homescreen/categories/movie/maintile_widget.dart';
import 'package:netflix_clone/presentation/homescreen/categories/series/maintile_series.dart';
import 'package:netflix_clone/presentation/homescreen/widgets/appbar/appbar.dart';
import 'package:netflix_clone/presentation/homescreen/widgets/futuremethod.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class NetflixHomeScreen extends StatefulWidget {
  const NetflixHomeScreen({super.key});

  @override
  State<NetflixHomeScreen> createState() => _NetflixHomeScreenState();
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<TvSeries>> topRatedSeries;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getpopularMovies();
    nowPlayingMovies = Api().getnowPlayingMovies();
    topRatedSeries = Api().getTopRatedSeries();
  }

  // const SizedBox(
  //             height: 500, // Adjust the height as needed
  //             child: TopRatedMovie(),
  //           ),
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: appbarHomepage(context),
        extendBodyBehindAppBar: true,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1),
                        child: buildFutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            return MainCardWidget(snapshot: snapshot);
                          },
                        ),
                      ),
                      buildFutureBuilder(
                        future: trendingMovies,
                        builder: (context, snapshot) {
                          return MainTileCard(
                            title: "Trending Now",
                            snapshot: snapshot,
                          );
                        },
                      ),
                      buildFutureBuilder(
                        future: nowPlayingMovies,
                        builder: (context, snapshot) {
                          return MainTileCard(
                            title: "Now Playing",
                            snapshot: snapshot,
                          );
                        },
                      ),
                      buildFutureBuilder(
                        future: upComingMovies,
                        builder: (context, snapshot) {
                          return MainTileCard(
                            title: "Upcoming Movies",
                            snapshot: snapshot,
                          );
                        },
                      ),
                      buildFutureBuilder(
                        future: topRatedSeries,
                        builder: (context, snapshot) {
                          return MainTileCardSeries(
                            title: "Top Rated TV Series",
                            snapshot: snapshot,
                          );
                        },
                      ),
                      buildFutureBuilder(
                        future: popularMovies,
                        builder: (context, snapshot) {
                          return MainTileCard(
                            title: "Popular Movies",
                            snapshot: snapshot,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NumberTitileCard {}
