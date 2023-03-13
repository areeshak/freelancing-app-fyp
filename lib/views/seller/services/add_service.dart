import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/entities/seller/service.dart';
import 'package:freelancing_fyp/utils/custom_appbar.dart';
import 'package:freelancing_fyp/widgets/custom_button.dart';
import 'package:freelancing_fyp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  bool isPartTime = false;
  late TextEditingController _category,
      _subCategory,
      _title,
      _description,
      _charges,
      _delivery,
      _sample;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _category = TextEditingController();
    _subCategory = TextEditingController();
    _title = TextEditingController();
    _description = TextEditingController();
    _charges = TextEditingController();
    _delivery = TextEditingController();
    _sample = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Service", []),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          SwitchListTile(
            title: const Text('Part Time'),
            value: isPartTime,
            onChanged: (value) {
              setState(() {
                isPartTime = value;
              });
            },
          ),
          // DropdownButtonFormField(items: items, onChanged: (value) => {});
          CustomTextField(controller: _category, labelText: 'Category'),
          CustomTextField(controller: _subCategory, labelText: 'Sub Category'),
          CustomTextField(controller: _title, labelText: 'Title'),
          CustomTextField(controller: _description, labelText: 'Description'),
          CustomTextField(controller: _sample, labelText: 'Sample'),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child:
                    CustomTextField(controller: _charges, labelText: 'Charges'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: CustomTextField(
                    controller: _delivery, labelText: 'Delivery Time'),
              ),
            ],
          ),
          CustomButton(
              onTap: () {
                context.read<SellerProvider>().addService(Service(
                    title: _title.text,
                    description: _description.text,
                    charges: double.parse(_charges.text),
                    deliveryTime: int.parse(_delivery.text),
                    samplePath: _sample.text,
                    category: _category.text,
                    subCategory: _subCategory.text));
                print("Service added");
                Navigator.pop(context);
              },
              text: 'Add Service'),
        ],
      ),
    );
  }
}
