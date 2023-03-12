import 'package:flutter/material.dart';
import 'package:freelancing_fyp/views/seller/about.dart';
import 'package:freelancing_fyp/views/seller/reviews.dart';
import 'package:freelancing_fyp/views/seller/services/list.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({super.key});

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              children: const [
                MyProfileWidget(),
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Services'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [AboutTab(), ServicesTab(), ReviewsTab()],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.zero,
      title: const Text('Sana Samad'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('sana_samad\n'),
          Row(
            children: const [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text('4.0 (456 Reviews)')
            ],
          )
        ],
      ),
      leading: const CircleAvatar(
        // radius: 10,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80'),
      ),
      trailing: IconButton(
        icon: Icon(Icons.chat),
        onPressed: () {},
      ),
    );
  }
}
