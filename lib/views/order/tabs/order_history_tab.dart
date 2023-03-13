import 'package:flutter/material.dart';
// import 'package:freelancing_fyp/views/order/orderProgress.dart';

import '../../../entities/order.dart';
import '../../../utils/orderStatusMap.dart';

class OrderHistoryTab extends StatefulWidget {
  const OrderHistoryTab({Key? key}) : super(key: key);

  @override
  State<OrderHistoryTab> createState() => _OrderHistoryTabState();
}

class _OrderHistoryTabState extends State<OrderHistoryTab> {
  List<Order> orders = [
    Order(
      taskTitle: "I want to get a video for facebook page",
      orderStatus: "Accepted",
      delivery: DateTime(2023, 3, 13),
    ),
    Order(
      taskTitle: "I want to get a digital video campaign",
      orderStatus: "Rejected",
      delivery: DateTime(2023, 3, 7),
    ),
    Order(
      taskTitle: "I want to get a video for facebook",
      orderStatus: "Accepted",
      delivery: DateTime(2023, 2, 25),
    ),
    Order(
      taskTitle: "I want someone to do voiceover",
      orderStatus: "Accepted",
      delivery: DateTime(2022, 1, 29),
    ),
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
                  Icon(
                    statusIcons[orders[index].orderStatus],
                    color: statusColor[orders[index].orderStatus],
                  ),
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
            subtitle: Text(getStatusMessage(
                orderStatus: orders[index].orderStatus,
                delivery: orders[index].delivery)),
            trailing: IconButton(
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
        ),
      ),
    );
  }
}
