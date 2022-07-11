import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Future<User?> register(String email, String password);
}
