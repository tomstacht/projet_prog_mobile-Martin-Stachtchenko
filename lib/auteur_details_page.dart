import 'dart:ui'; // Import for using the ImageFilter class
import 'package:flutter/material.dart';
import 'auteur.dart';

class AuteurDetailPage extends StatefulWidget {
  final Auteur auteur;
  final String selectedCategory;

  const AuteurDetailPage({Key? key, required this.auteur, required this.selectedCategory}) : super(key: key);

  @override
  _AuteurDetailPageState createState() => _AuteurDetailPageState();
}

class _AuteurDetailPageState extends State<AuteurDetailPage> with SingleTickerProviderStateMixin {
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

  Widget _buildCategoryInfo(String category, Auteur auteur) {
    Color backgroundColor;
    switch (category) {
      case 'bio':
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
                auteur.bio,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      case 'infos':
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
            padding: const EdgeInsets.all(8.0),
            child: _buildInfoList(auteur),
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
        title: Text(widget.auteur.nom, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              widget.auteur.imageUrl,
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
                    Tab(text: 'Biographie'),
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
                      _buildCategoryInfo('bio', widget.auteur),
                      _buildCategoryInfo('infos', widget.auteur),
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

  Widget _buildInfoList(Auteur auteur) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        _buildInfoItem('Nom', auteur.nom),
        _buildInfoItem('Activité', auteur.activite),
        _buildInfoItem('Genre', auteur.genre),
        _buildInfoItem('Date de naissance', auteur.datenaissance),
        _buildInfoItem('Date de décès', auteur.datedeces),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }


}
