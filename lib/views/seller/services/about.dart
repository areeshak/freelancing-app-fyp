import 'package:flutter/material.dart';

class AboutService extends StatefulWidget {
  String about;
  AboutService({super.key, required this.about});

  @override
  State<AboutService> createState() => _AboutServiceState();
}

class _AboutServiceState extends State<AboutService> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(title: Text('About\n'), subtitle: Text(widget.about)));
  }
}
