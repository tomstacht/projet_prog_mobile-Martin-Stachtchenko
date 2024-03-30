import 'package:flutter/material.dart';

class HorizontalItemGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T) itemBuilder;

  const HorizontalItemGrid({Key? key, required this.items, required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set the height to fit the design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemBuilder(items[index]);
        },
      ),
    );
  }
}
