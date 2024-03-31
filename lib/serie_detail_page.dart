import 'dart:ui'; // Import for using the ImageFilter class
import 'package:flutter/material.dart';
import 'models/serie.dart';

class SerieDetailPage extends StatefulWidget {
  final Serie serie;
  final String selectedCategory;

  const SerieDetailPage({Key? key, required this.serie, required this.selectedCategory}) : super(key: key);

  @override
  _SerieDetailPageState createState() => _SerieDetailPageState();
}

class _SerieDetailPageState extends State<SerieDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCategoryInfo(String category) {
    Color backgroundColor;
    switch (category) {
      case 'histoire':
        backgroundColor = Colors.blue; // Background color for story
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Content for story',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      case 'personnages':
        backgroundColor = Colors.blue; // Background color for author
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Content for personnages',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      case 'episodes':
        backgroundColor = Colors.blue; // Background color for character
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Content for episodes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.serie.titre, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background Image with Blur
          Positioned.fill(
            child: Image.network(
              widget.serie.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Blurred Background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight), // Ensure content starts below the AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Cover Image and Details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cover Image (small)
                      SizedBox(
                        width: 100, // Adjust size as needed
                        height: 150, // Adjust size as needed
                        child: Image.network(
                          widget.serie.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Issue Number
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/ic_books_bicolor.png',
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Issue Number: ${widget.serie.issueNumber}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            // Release Date
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/ic_calendar_bicolor.png',
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Release Date: ${widget.serie.releaseDate}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Tab Bar
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  tabs: [
                    const Tab(
                      text: 'Histoire',
                    ),
                    const Tab(
                      text: 'Personnages',
                    ),
                    const Tab(
                      text: 'Episodes',
                    ),
                  ],
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.orange, // Color of the indicator bar
                        width: 3.0, // Width of the indicator bar
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildCategoryInfo('histoire'),
                      _buildCategoryInfo('personnages'),
                      _buildCategoryInfo('episodes'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
