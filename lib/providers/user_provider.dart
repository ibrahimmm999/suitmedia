import 'package:flutter/material.dart';
import 'package:suitmedia/models/user_model.dart';
import 'package:suitmedia/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _listUser = [];
  List<UserModel> _listSelectedUser = [];
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  List<UserModel> get listUser => _listUser;
  List<UserModel> get listSelectedUser => _listSelectedUser;

  set setlistUser(List<UserModel> listUser) {
    _listUser = listUser;
    notifyListeners();
  }

  set setlistSelectedUser(List<UserModel> listSelectedUser) {
    _listSelectedUser = listSelectedUser;
    notifyListeners();
  }

  Future<bool> getDataUsers() async {
    try {
      _listUser = await UserService().getUsers();

      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }

  void selectUser(UserModel user) {
    _listSelectedUser.add(user);
    notifyListeners();
  }

  void removeUser(UserModel user) {
    _listSelectedUser.remove(user);
    notifyListeners();
  }
}
