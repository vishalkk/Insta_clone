import 'package:flutter/material.dart';
import 'package:insta_clone/model/user.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
   User? _user; 

  final AuthMethod _authMethods = AuthMethod();

  User get getUser => _user!;
 

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
