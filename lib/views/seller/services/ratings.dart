import 'package:flutter/material.dart';

class RatingsWidget extends StatelessWidget {
  String ratings;
  RatingsWidget({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text("Rating\n"), subtitle: Text(ratings)),
    );
  }
}
