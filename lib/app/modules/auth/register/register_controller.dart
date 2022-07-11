import 'package:flutter/material.dart';

import '../../../exceptions/auth_exception.dart';
import '../../../services/user/i_user_service.dart';

class RegisterController extends ChangeNotifier {
  final IUserService _userService;
  String? error;
  bool success = false;

  RegisterController({
    required IUserService userService,
  }) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        success = true;
      } else {
        error = 'Erro ao registrar usuário.';
      }
    } on AuthException catch (err) {
      error = err.message;
    } finally {
      notifyListeners();
    }
  }
}
