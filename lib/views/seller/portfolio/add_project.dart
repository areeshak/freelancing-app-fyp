import 'package:flutter/material.dart';
import 'package:freelancing_fyp/controllers/seller/seller_provider.dart';
import 'package:freelancing_fyp/entities/seller/project.dart';
import 'package:provider/provider.dart';

import '../../../utils/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  late TextEditingController _title, _description, _sample;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = TextEditingController();
    _description = TextEditingController();
    _sample = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Project", []),
      body: ListView(
        children: [
          CustomTextField(controller: _title, labelText: 'Title'),
          CustomTextField(controller: _description, labelText: 'Description'),
          CustomTextField(controller: _sample, labelText: 'Sample'),
        ],
      ),
      floatingActionButton: CustomButton(
          onTap: () {
            context.read<SellerProvider>().addProject(
                Project(_description.text, _sample.text, title: _title.text));
            Navigator.pop(context);
          },
          text: 'Add Project'),
    );
  }
}
