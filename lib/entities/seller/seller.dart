import 'package:freelancing_fyp/entities/seller/project.dart';
import 'package:freelancing_fyp/entities/seller/review.dart';
import 'package:freelancing_fyp/entities/seller/service.dart';

class Seller {
  String name;
  String username;
  String about = '';
  bool isPartTime = false;
  List<String> skills = [];
  List<Service> _services = [];
  List<Project> _portfolio = [];
  List<Review> _reviews = [];
  double rating = 0;
  String image = '';

  Seller({
    required this.name,
    required this.username,
  });

  List<Project> get portfolio => _portfolio;

  List<Service> get services => _services;

  List<Project> get reviews => _portfolio;
}
