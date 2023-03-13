import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  String experience;
  ExperienceWidget({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text("Seller's Experience\n"), subtitle: Text(experience)));
  }
}
