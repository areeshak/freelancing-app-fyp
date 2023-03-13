import 'package:flutter/cupertino.dart';

import '../../entities/seller/project.dart';
import '../../entities/seller/seller.dart';
import '../../entities/seller/service.dart';

class SellerProvider extends ChangeNotifier {
  Seller _seller = Seller(name: "Sana Samad", username: "sana_samad");

  set seller(Seller seller) {
    _seller = seller;
    notifyListeners();
  }

  Seller get seller => _seller;

  List<Service> get services => _seller.services;

  List<Project> get portfolio => _seller.portfolio;

  void addService(Service service) {
    _seller.addService(service);
    notifyListeners();
  }

  void deleteService(Service service) {
    _seller.deleteService(service);
    notifyListeners();
  }

  void addProject(Project project) {
    _seller.addProject(project);
    notifyListeners();
  }

  void deleteProject(Project project) {
    _seller.deleteProject(project);
    notifyListeners();
  }
}
