import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/new&hot.dart/newsfeedscreen%20.dart';

Widget builderfact(Future<List<Movie>> trendingMovies) {
  return FutureBuilder(
    future: trendingMovies,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text(snapshot.error.toString()),
        );
      } else if (snapshot.hasData) {
        return ListView.separated(
          itemBuilder: (context, index) =>
              NewAndHotScreen(snapshot: snapshot, index: index),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: snapshot.data!.length,
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
