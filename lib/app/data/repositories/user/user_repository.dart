import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginTypes.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginTypes.contains('google')) {
        throw AuthException(
          message: 'Cadastro realizado com o Google não pode ser resetada a senha!',
        );
      } else {
        throw AuthException(message: 'e-Mail não cadastrado!');
      }
    } on PlatformException catch (e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');

      throw AuthException(message: 'Erro ao resetar senha de acesso!');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginTypes;

    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginTypes.contains('password')) {
          throw AuthException(
            message:
                'Você utilizou o e-mail para cadastro no Todo List, caso tenha esquicido sua senha, por favor clique no link Esqueci minha senha.',
          );
        } else {
          final googleAuth = await googleUser.authentication;

          final firebaseCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          final userCredential =
              await _firebaseAuth.signInWithCredential(firebaseCredential);

          return userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');

      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(
          message: '''
          Login inválido. Você se registrou no Todo List com os seguintes provedores:
          ${loginTypes?.join(', ')}
        ''',
        );
      } else {
        throw AuthException(message: 'Erro ao realizar login!');
      }
    }

    return null;
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }

  @override
  Future<void> updateDisplayName(String name) async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      await user.updateDisplayName(name);
      user.reload();
    }
  }
}
