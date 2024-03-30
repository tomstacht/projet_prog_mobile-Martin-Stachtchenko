import 'dart:ui'; // Import for using the ImageFilter class
import 'package:flutter/material.dart';
import 'comic.dart';
import 'personnage.dart';
import 'details_personnage.dart';

class ComicDetailPage extends StatefulWidget {
  final Comic comic;
  final String selectedCategory;

  const ComicDetailPage({Key? key, required this.comic, required this.selectedCategory}) : super(key: key);

  @override
  _ComicDetailPageState createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Personnage> personnages = List.generate(10, (index) => Personnage.mock());

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
        backgroundColor = Color(0xFF1E3243); // Background color for story
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.comic.histoire,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      case 'auteur':
        backgroundColor = Color(0xFF1E3243); // Background color for author
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.comic.auteurs.map((auteur) => Text(
                auteur,
                style: TextStyle(color: Colors.white),
              )).toList(),
            ),
          ),
        );
      case 'personnage':
        backgroundColor = Color(0xFF1E3243); // Background color for character
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: personnages.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // La navigation se fait ici
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonnageDetailPage(
                        personnage: personnages[index],
                        selectedCategory: 'histoire', // ou une autre catégorie selon votre logique
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(personnages[index].imageUrl),
                  ),
                  title: Text(personnages[index].nomsuperheros, style: TextStyle(color: Colors.white)),
                ),
              );
            },
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
        title: Text(widget.comic.titre, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background Image with Blur
          Positioned.fill(
            child: Image.network(
              widget.comic.imageUrl,
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
                          widget.comic.imageUrl,
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
                                  SizedBox(width: 8),
                                  Text(
                                    'Issue Number: ${widget.comic.issueNumber}',
                                    style: TextStyle(color: Colors.white),
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
                                  SizedBox(width: 8),
                                  Text(
                                    'Release Date: ${widget.comic.releaseDate}',
                                    style: TextStyle(color: Colors.white),
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
                    Tab(
                      text: 'Histoire',
                    ),
                    Tab(
                      text: 'Auteurs',
                    ),
                    Tab(
                      text: 'Personnages',
                    ),
                  ],
                  indicator: BoxDecoration(
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
                      _buildCategoryInfo('auteur'),
                      _buildCategoryInfo('personnage'),
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
