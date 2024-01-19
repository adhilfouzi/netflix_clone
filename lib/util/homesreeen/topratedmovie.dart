import 'package:flutter/material.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          borderOnForeground: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.network(
                'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5M3bY1rl9QIQSmrAGPEt9qutj64.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle the tap on "Play"
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle the tap on "My List"
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blueGrey),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'My List',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
