import 'package:flutter/material.dart';

class ItemCard<T> extends StatelessWidget {
  final T item;
  final String imageUrlField;
  final String titleField;
  final String category;
  final Function(T) onTap; // Define onTap parameter


  const ItemCard({
    Key? key,
    required this.item,
    required this.imageUrlField,
    required this.titleField,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(item);
        // La navigation se déclenche ici
        // Vous pouvez personnaliser cette partie selon vos besoins
      },
      child: Card(
        color: const Color(0xFF1E3243),
        child: Column(
          children: <Widget>[
            Image.network(
              imageUrlField, // Utilisez le champ imageUrlField pour l'URL de l'image
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.error); // Placeholder for errors
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titleField, // Utilisez le champ titleField pour le titre
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // ... autres détails de la carte
          ],
        ),
      ),
    );
  }
}
