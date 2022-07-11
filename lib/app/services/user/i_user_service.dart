import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserService {
  Future<User?> register(String email, String password);
}
