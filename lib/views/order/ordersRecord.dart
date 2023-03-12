import 'package:flutter/material.dart';

import 'tabs/active_order_tab.dart';
import 'tabs/order_history_tab.dart';


class OrdersRecord extends StatelessWidget {
  const OrdersRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const TabBar(
              indicatorColor: Colors.blueGrey,
              labelStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  text: 'Active Orders',
                ),
                Tab(
                  text: 'Order History',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ActiveOrderTab(), //1st tab
                  const OrderHistoryTab(), //2nd tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
