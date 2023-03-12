import 'package:flutter/material.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                // contentPadding: EdgeInsets.zero,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'from Rs. 4,500',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Text('Best Logo Design for website'),
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
                    'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                trailing: const Icon(
                  Icons.person,
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10),
    );
  }
}
