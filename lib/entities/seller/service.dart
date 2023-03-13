import 'package:flutter/material.dart';

class Service {
  String title;
  String description;
  double charges;
  int deliveryTime;
  bool isPartTime = false;
  String samplePath;
  String category;
  String subCategory;

  Service(
      {required this.title,
      required this.description,
      required this.charges,
      required this.deliveryTime,
      required this.samplePath,
      required this.category,
      required this.subCategory});
}
