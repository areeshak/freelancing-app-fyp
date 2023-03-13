import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/entities/seller/service.dart';
import 'package:freelancing_fyp/utils/custom_appbar.dart';
import 'package:freelancing_fyp/utils/showToastMessage.dart';
import 'package:freelancing_fyp/views/seller/profile.dart';
import 'package:freelancing_fyp/widgets/custom_carousel.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'ratings.dart';
import 'seller_experience.dart';
import 'service_delivarables.dart';

class ServicePage extends StatefulWidget {
  Service service;
  ServicePage({super.key, required this.service});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late Service service;
  late bool editing;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    service = widget.service;
    editing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "",
        [
          editing
              ? IconButton(
                  onPressed: () {
                    editing = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.check))
              : IconButton(
                  onPressed: () {
                    editing = true;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                context.read<SellerProvider>().deleteService(service);
                Navigator.pop(context);
                showToastMessage("You deleted the service");
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView(
        children: [
          Carousel(images: images),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'sana_samad',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'from Rs. ${service.charges}',
                  // 'from Rs. 9,500',
                ),
              ],
            ),
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(
                  MaterialPageRoute(builder: (builder) => SellerProfile())),
              child: const CircleAvatar(
                // radius: 10,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80"),
              ),
            ),
          ),
          Text(
            service.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          AboutService(about: service.description),
          ExperienceWidget(experience: service.description),
          DeliverablesWidget(
            deliverables: service.description,
          ),
          RatingsWidget(
            ratings: service.description,
          )
        ],
      ),
    );
  }
}
