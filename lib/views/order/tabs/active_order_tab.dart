import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../entities/order.dart';

class ActiveOrderTab extends StatelessWidget {
  ActiveOrderTab({Key? key}) : super(key: key);

  List<Order> orders = [
    Order(
      taskTitle: "I want to get a video for facebook page",
      orderStatus: "Ongoing",
      delivery: DateTime(2023, 3, 2),
    ),
    Order(
      taskTitle: "I want to get a digital video campaign",
      orderStatus: "Delivered",
      delivery: DateTime(2023, 3, 13),
    ),
    Order(
      taskTitle: "I want to get a video for facebook",
      orderStatus: "Revision",
      delivery: DateTime(2023, 3, 15),
    ),
    // Order(
    //   taskTitle: "I want someone to do voiceover",
    //   orderStatus: "Accepted",
    //   delivery: DateTime(2022, 10, 12),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
          // shape: const RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          //color: Colors.blueGrey.shade50,
          child: ListTile(
            leading: SizedBox(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  orders[index].orderStatus == "Ongoing"
                      ? const FaIcon(
                          FontAwesomeIcons.spinner,
                          color: Colors.orange,
                        )
                      : (orders[index].orderStatus == "Delivered"
                          ? const FaIcon(
                              FontAwesomeIcons.circleCheck,
                              color: Colors.green,
                            )
                          : const FaIcon(FontAwesomeIcons.rightLeft,
                              color: Colors.yellow)),
                  Text(orders[index].orderStatus),
                ],
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                orders[index].taskTitle,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            subtitle: Text(orders[index].delivery.isBefore(DateTime.now())
                ? ('Delivered on ${DateFormat.yMMMd().format(orders[index].delivery)}')
                : ('Delivery in ${orders[index].delivery.difference(DateTime.now()).inDays} day(s)'),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ),
    );
  }
}
