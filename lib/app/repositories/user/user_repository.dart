import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../exceptions/auth_exception.dart';
import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');

      debugPrint('e.code: ${e.code}');

      if (e.code == 'email-already-in-use') {
        final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);

        if (loginTypes.contains('password')) {
          throw AuthException(
            message: 'E-mail já utilizado, por favor escolha outro e-mail!',
          );
        } else {
          throw AuthException(
            message:
                'Você se cadastrou no Todo List pelo Google, por favor utilize ele para acessar!',
          );
        }
      } else {
        throw AuthException(
          message: e.message ?? 'Erro ao registrar o usuário!',
        );
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on PlatformException catch (e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');

      throw AuthException(message: e.message ?? 'Erro ao realizar o login!');
    } on FirebaseAuthException catch (e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');

      if (e.code == 'wrong-password') {
        throw AuthException(message: e.message ?? 'Usuário ou senha inválidos!');
      }

      throw AuthException(message: e.message ?? 'Erro ao realizar o login!');
    }
  }
}
