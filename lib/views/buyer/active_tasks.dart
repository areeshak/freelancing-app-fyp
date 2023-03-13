import 'package:flutter/material.dart';
import 'package:freelancing_fyp/entities/task.dart';

class ActiveTasks extends StatelessWidget {
  ActiveTasks({Key? key}) : super(key: key);

  List<Task> activeTasks = [
    Task(
      category: "Graphics & Design",
      sub_category: "Logo Design",
      taskTitle: "I want to get a logo for my website",
      taskDesc: "Want minimilistic logo for my furniture company. The size will be of 21x 36 and want dark color theme to be followed",
      taskBudget: 5000,
      featured: true,
      requests_recieved: 6
    ),
    Task(
        category: "Video & Animation",
        sub_category: "Video Ads & Commercials",
        taskTitle: "I want to get a digital video for campaign",
        taskDesc: "I own a clothing brand and I want a detailed video with voice over and actors displaying my products",
        taskBudget: 15000,
        featured: false,
        requests_recieved: 3
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: activeTasks.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
          // shape: const RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          //color: Colors.blueGrey.shade50,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                maxLines: 2,
                activeTasks[index].taskTitle,
                style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activeTasks[index].taskDesc,
                  maxLines: 2,
                  style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                Text('Budget: ' + activeTasks[index].taskBudget.toString()),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                activeTasks[index].featured?
                Text('Featured', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500),)
                    : Text (""),
                Text(activeTasks[index].requests_recieved.toString() + ' Requests'),
                Container(
                  height: 18,
                  width:10,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         OrderProgressScreen(order: orders[index]),
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

              ],
            ),


          ),
        ),
      ),
    );
  }
}
