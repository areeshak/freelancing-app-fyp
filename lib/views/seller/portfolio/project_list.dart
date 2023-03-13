import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/entities/seller/project.dart';
import 'package:freelancing_fyp/utils/showToastMessage.dart';
import 'package:freelancing_fyp/views/seller/portfolio/add_project.dart';
import 'package:freelancing_fyp/utils/custom_appbar.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<Project> portfolio = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    portfolio = context.watch<SellerProvider>().portfolio;

    return Scaffold(
      appBar: customAppBar("Portfolio", []),
      body: portfolio.isEmpty
          ? const Text(
              'No projects added yet',
              textAlign: TextAlign.center,
            )
          : ListView.separated(
              itemBuilder: (context, index) =>
                  MyProjectWidget(project: portfolio[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: portfolio.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => AddProject())),
        tooltip: 'Add Project',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyProjectWidget extends StatefulWidget {
  Project project;
  MyProjectWidget({super.key, required this.project});

  @override
  State<MyProjectWidget> createState() => _MyProjectWidgetState();
}

class _MyProjectWidgetState extends State<MyProjectWidget> {
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
          title: Text('${widget.project.title}\n'),
          trailing: PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            onSelected: (item) => performAction(item),
            itemBuilder: (context) => const [
              PopupMenuItem<int>(value: 0, child: Text('Edit')),
              PopupMenuItem<int>(value: 1, child: Text('Delete')),
            ],
          ),
          subtitle: Text(
            widget.project.description,
          ),
        )
      ],
    ));
  }

  void performAction(int value) {
    switch (value) {
      case 0:
        showToastMessage("You edited the project");
        break;
      case 1:
        context.read<SellerProvider>().deleteProject(widget.project);
        break;
      default:
    }
  }
}
