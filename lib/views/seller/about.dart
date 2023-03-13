import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/views/seller/portfolio/project_list.dart';
import 'package:provider/provider.dart';

import '../../entities/seller/seller.dart';

class AboutTab extends StatefulWidget {
  Seller seller;
  AboutTab({super.key, required this.seller});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // seller.portfolio =
    widget.seller = context.watch<SellerProvider>().seller;

    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('About ${widget.seller.name}\n'),
              subtitle: Text(widget.seller.about),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Portfolio'),
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (builder) => const Portfolio())),
                    icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
            subtitle: widget.seller.portfolio.isEmpty
                ? null
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.seller.portfolio.length,
                      itemBuilder: (context, index) => Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(widget.seller.portfolio[index].title)
                      ]),
                    ),
                  ),
          ),
          Card(
            child: ListTile(
              title: const Text('Skills'),
              subtitle: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: mapSkills(widget.seller.skills)),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> mapSkills(List<String> skills) {
  return skills.map((e) => Chip(label: Text(e))).toList();
}
