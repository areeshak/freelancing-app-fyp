import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_fyp/views/buyer/active_tasks.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text:'Active Tasks'),
              Tab(text:'Tasks History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: ActiveTasks()),
            Center(child: Text('History of tasks')),
          ],
        ),
      ),
    );
  }
}
