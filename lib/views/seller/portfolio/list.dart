import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:freelancing_fyp/views/seller/portfolio/add.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Portfolio'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => MyProjectWidget(),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => AddProject())),
        tooltip: 'Add Project',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyProjectWidget extends StatelessWidget {
  const MyProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
            'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Logo Design for brand\n'),
          trailing: PopupMenuButton<int>(
            onSelected: (item) => {},
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Edit')),
              PopupMenuItem<int>(value: 1, child: Text('Delete')),
            ],
          ),
          subtitle: Text(
              'I created a rent-a-car full stack mobile app with front-en don Flutter and Firebase. Full state management\n\n https://www.lipsum.com/feed/html'),
        )
      ],
    ));
  }
}
