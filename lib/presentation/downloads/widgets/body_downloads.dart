import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/api.dart';
import '../../../constants/colors/common_colors.dart';
import '../../../models/movie.dart';
import 'center_images/download_images.dart';

class BodyDownloads extends StatefulWidget {
  const BodyDownloads({super.key}); 

  @override
  State<BodyDownloads> createState() => _BodyDownloadsState();
}

class _BodyDownloadsState extends State<BodyDownloads> {


  late Future<List<Movie>> nowPlayingMovies;

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getnowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.settings,
                color: textColor,
              ),
            ),
            Text(
              'Smart Downloads',
              style: GoogleFonts.montserrat(
                  fontSize: 13, color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Turn on Downloads for You',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: titleColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We will download movies and shows just for you,so you will always  have something to watch.',
                  style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade900,
                        radius: screenSize.width * 0.34,
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: nowPlayingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return DownloadImages(
                                index: 0,
                                snapshot: snapshot,
                                screenSizeWidth: screenSize.width * 0.30,
                                screenSizeHeight: screenSize.height * 0.20, 
                                angle: 20,
                                margin: const EdgeInsets.only(
                                    left: 200, bottom: 35),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: nowPlayingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return DownloadImages(
                                index: 1,
                                snapshot: snapshot,
                                screenSizeWidth: screenSize.width * 0.30,
                                screenSizeHeight: screenSize.height * 0.20,
                                angle: -20,
                                margin: const EdgeInsets.only(
                                    right: 200, bottom: 35),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: nowPlayingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return DownloadImages(
                                index: 2, 
                                snapshot: snapshot,
                                screenSizeWidth: screenSize.width * 0.37, 
                                screenSizeHeight: screenSize.height * 0.25 ,
                                angle: 0,
                                margin: const EdgeInsets.only(left: 0),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Set Up',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade900,
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Find More to Download',
                        style: TextStyle(color: titleColor),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
