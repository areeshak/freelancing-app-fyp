import 'package:flutter/material.dart';

class DeliverablesWidget extends StatelessWidget {
  String deliverables;
  DeliverablesWidget({super.key, required this.deliverables});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: const Text("Delivarables\n"), subtitle: Text(deliverables)));
  }
}
