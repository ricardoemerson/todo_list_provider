import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/user/i_user_repository.dart';
import 'i_user_service.dart';

class UserService implements IUserService {
  final IUserRepository _userRepository;

  UserService({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) => _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();

  @override
  Future<void> googleLogout() => _userRepository.googleLogout();
}
