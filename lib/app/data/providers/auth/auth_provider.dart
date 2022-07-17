import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/navigator/todo_list_navigator.dart';
import '../../services/user/i_user_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final IUserService _userService;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required IUserService userService,
  })  : _firebaseAuth = firebaseAuth,
        _userService = userService;

  User? get user => _firebaseAuth.currentUser;

  Future<void> logout() => _userService.logout();

  void loadListener() {
    _firebaseAuth.userChanges().listen((_) {
      notifyListeners();
    });

    _firebaseAuth.idTokenChanges().listen((user) {
      if (user != null) {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}
