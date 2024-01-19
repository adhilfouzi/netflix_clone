import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/search/widgets/search_result.dart';
import 'package:netflix_clone/search/widgets/search_tile.dart';
import '../../api/api.dart';
import '../../constants/colors/common_colors.dart';
import '../../models/movie.dart';

TextEditingController searchController = TextEditingController();

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<Movie>> popularMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getpopularMovies();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.text = '';
  }

  String searchContent = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.black87,
              actions: const []),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: const TextStyle(color: titleColor),
                  controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      prefixIcon: const Icon(CupertinoIcons.search),
                      prefixIconColor: textColor,
                      hintText: 'Search for titles, genres or people',
                      hintStyle: const TextStyle(
                        color: textColor,
                      ),
                      suffixIcon: const Icon(CupertinoIcons.mic),
                      suffixIconColor: textColor,
                      border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      searchContent = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  searchContent.isEmpty ? 'Top Searches' : 'Movies & TV',
                  style: const TextStyle(
                      color: titleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return searchContent.isEmpty
                            ? SearchTile(
                                snapshot: snapshot,
                              )
                            : SearchResultWidget(
                                searchMovies: Api().search(searchContent),
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
