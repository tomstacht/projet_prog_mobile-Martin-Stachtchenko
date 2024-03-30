import 'dart:ui'; // Import for using the ImageFilter class
import 'package:flutter/material.dart';
import 'personnage.dart';

class PersonnageDetailPage extends StatefulWidget {
  final Personnage personnage;
  final String selectedCategory;

  const PersonnageDetailPage({Key? key, required this.personnage, required this.selectedCategory}) : super(key: key);

  @override
  _PersonnageDetailPageState createState() => _PersonnageDetailPageState();
}

class _PersonnageDetailPageState extends State<PersonnageDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                'Content for histoire',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      case 'infos':
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
                'Content for infos',
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
        title: Text(widget.personnage.nomsuperheros, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned.fill(
          child: Image.network(
            widget.personnage.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
            // Blurred Background
            Positioned.fill(
            child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
    ),
            ),
          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight), // Ensure content starts below the AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tab Bar
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  tabs: const [
                    Tab(text: 'Histoire'),
                    Tab(text: 'Infos'),
                  ],
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.orange,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildCategoryInfo('histoire'),
                      _buildCategoryInfo('infos'),
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
