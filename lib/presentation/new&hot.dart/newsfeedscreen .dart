import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/colors/common_colors.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(CupertinoIcons.search),
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
            //   _buildCategoryTabs(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10, // Replace with the actual number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date on the left side
                        Container(
                          padding: const EdgeInsets.symmetric(
                            // horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            //  color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Feb \n14', // Replace with the actual date
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Movie details on the right side
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
                                //  const SizedBox(width: 10),
                                // Movie information
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
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: Image.network(
                                            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      // Movie buttons (Remind Me & Info)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                "Remaind Me",
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
                                                'info',
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      // Movie title and description
                                      Text(
                                        'Movie Title ${index + 1}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                        maxLines: 3,
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
  }
}
