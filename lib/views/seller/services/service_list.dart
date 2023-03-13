import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/views/seller/services/view_service.dart';
import 'package:provider/provider.dart';
import '../services/add_service.dart';
import '../../../entities/seller/service.dart';

class ServicesTab extends StatefulWidget {
  // List<Service> services;
  ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<Service> services = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    services = context.watch<SellerProvider>().services;
    return Scaffold(
        body: services.isEmpty
            ? Center(
                child: Text('No Services added',
                    style: Theme.of(context).textTheme.displaySmall),
              )
            : ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      // contentPadding: EdgeInsets.zero,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'from Rs. ${services[index].charges}',
                            // 'from Rs. 4500',

                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(services[index].title),
                          // Text('Do excel automation & vba'),
                        ],
                      ),
                      subtitle: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text('4.0 (456 Reviews)')
                        ],
                      ),
                      leading: Image.network(
                          "https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                          // services[index].samplePath
                          ),
                      trailing: const Icon(
                        Icons.person,
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => ServicePage(
                                service: services[index],
                              ))),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount:
                    // 10
                    services.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => AddService())),
          child: const Icon(Icons.add),
        ));
  }
}
