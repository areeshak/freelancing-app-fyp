import '../seller/project.dart';
import '../seller/review.dart';
import '../seller/service.dart';

class Seller {
  String name;
  String username;
  String about = '';
  List<String> skills = [];
  List<Service> _services = [];
  List<Project> _portfolio = [];
  List<Review> _reviews = [];
  double rating = 0;
  String image =
      "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80";

  Seller({
    required this.name,
    required this.username,
  });

  List<Project> get portfolio => _portfolio;

  List<Service> get services => _services;

  List<Review> get reviews => _reviews;

  void addService(Service service) {
    _services.add(service);
  }

  void deleteService(Service service) {
    _services.removeWhere((element) => element == service);
  }

  void addProject(Project project) {
    _portfolio.add(project);
  }

  void deleteProject(Project project) {
    _portfolio.removeWhere((element) => element == project);
  }
}
