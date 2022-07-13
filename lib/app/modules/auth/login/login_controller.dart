import 'package:flutter/material.dart';

import '../../../core/notifiers/default_change_notifier.dart';
import '../../../exceptions/auth_exception.dart';
import '../../../services/user/i_user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final IUserService _userService;
  String? infoMessage;

  LoginController({
    required IUserService userService,
  }) : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();

      final user = await _userService.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválidos!');
      }
    } on AuthException catch (err) {
      setError(err.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();

      await _userService.forgotPassword(email);

      infoMessage = 'Reset de senha enviado para seu e-mail.';
    } on AuthException catch (err) {
      debugPrint('err: $err');

      setError(err.message);
    } catch (err) {
      setError('Erro ao resetar a senha!');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> googleLogin() async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();

      final user = await _userService.googleLogin();

      if (user != null) {
        success();
      } else {
        _userService.googleLogout();
        setError('Erro ao realizar o login com o Google.');
      }
    } on AuthException catch (err) {
      _userService.googleLogout();
      setError(err.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
