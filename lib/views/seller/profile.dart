import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/views/seller/about.dart';
import 'package:freelancing_fyp/views/seller/reviews.dart';
import 'package:freelancing_fyp/views/seller/services/service_list.dart';
import 'package:freelancing_fyp/utils/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../../entities/seller/seller.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({super.key});

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  late Seller _seller;

  @override
  void initState() {
    // TODO: implement initState
    _seller = Seller(name: 'Sana Samad', username: 'sana_samad');
    _seller.about =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac finibus odio. In viverra non neque eu lobortis. Maecenas lobortis ac lorem et vehicula. Donec porttitor dictum turpis, vitae rutrum dui posuere sed. Etiam vel dui posuere justo ullamcorper interdum interdum vel mi. Aliquam at dolor quis purus porta ultricies. Aliquam suscipit auctor metus eget accumsan. Proin feugiat justo non mauris placerat pretium. Maecenas sed placerat dolor. Nulla tempus lobortis mauris. Vivamus dignissim elementum lorem. Vivamus congue molestie convallis";
    _seller.rating = 4.0;
    _seller.image =
        "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80";
    _seller.skills = [
      "Data Science",
      "Machine Learning",
      "Graphic Design",
      "Excel Macro",
      "Adobe"
    ];
    context.read<SellerProvider>().seller = _seller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: customAppBar("", []),
          body: Center(
            child: Column(
              children: [
                MyProfileWidget(seller: _seller),
                const TabBar(
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
                    children: [
                      AboutTab(seller: _seller),
                      ServicesTab(),
                      ReviewsTab(reviews: _seller.reviews),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyProfileWidget extends StatelessWidget {
  Seller seller;
  MyProfileWidget({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.zero,
      title: Text(seller.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${seller.username}\n'),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text('${seller.rating} (456 Reviews)')
            ],
          )
        ],
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(seller.image),
      ),
      trailing: IconButton(
        icon: Icon(Icons.chat),
        onPressed: () {
          print("Image: " + seller.image);
        },
      ),
    );
  }
}
