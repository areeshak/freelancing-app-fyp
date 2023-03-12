import 'package:flutter/material.dart';
import 'package:freelancing_fyp/views/seller/portfolio/list.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const Card(
              child: ListTile(
                title: Text('About Sana\n'),
                subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac finibus odio. In viverra non neque eu lobortis. Maecenas lobortis ac lorem et vehicula. Donec porttitor dictum turpis, vitae rutrum dui posuere sed. Etiam vel dui posuere justo ullamcorper interdum interdum vel mi. Aliquam at dolor quis purus porta ultricies. Aliquam suscipit auctor metus eget accumsan. Proin feugiat justo non mauris placerat pretium. Maecenas sed placerat dolor. Nulla tempus lobortis mauris. Vivamus dignissim elementum lorem. Vivamus congue molestie convallis.'),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Portfolio'),
                  IconButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder) => Portfolio())),
                      icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
              subtitle: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          Image.network(
                              'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                          Text('Logo Design for brand')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          Image.network(
                              'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                          Text('Logo Design for brand')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          Image.network(
                              'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                          Text('Logo Design for brand')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Skills'),
                subtitle: Column(
                  children: [
                    Chip(
                      label: const Text('Data Science'),
                    ),
                    Chip(
                      label: const Text('Logo Design'),
                    ),
                    Chip(
                      label: const Text('Excel'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
