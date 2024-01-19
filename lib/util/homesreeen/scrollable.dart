import 'package:flutter/material.dart';

class RightScroll extends StatelessWidget {
  final String categoriesname;

  const RightScroll({
    super.key,
    required this.categoriesname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoriesname,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Horizontal List of Categories
        Container(
          height: 180, // Set a fixed height if needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20, // Replace with the actual number of items
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      borderOnForeground: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: SizedBox(
                          height: 150, // A djust the height as needed
                          child: Image.network(
                            'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5M3bY1rl9QIQSmrAGPEt9qutj64.jpg',
                            fit: BoxFit.fill,
                          ),
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
    );
  }
}


// Dummy data for categories
// List<String> categories = [
//   'Action',
//   'Comedy',
//   'Drama',
//   'Thriller',
//   'Documentary',
//   'Horror',
//   'Science Fiction',
// ];
