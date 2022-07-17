import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/database/sqlite_connection_factory.dart';
import 'data/providers/auth/auth_provider.dart';
import 'data/repositories/user/i_user_repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/services/user/i_user_service.dart';
import 'data/services/user/user_service.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => FirebaseAuth.instance,
        ),
        Provider(
          create: (_) => SqliteConnectionFactory.instance,
          lazy: false,
        ),
        Provider<IUserRepository>(
          create: (context) => UserRepository(firebaseAuth: context.read()),
        ),
        Provider<IUserService>(
          create: (context) => UserService(userRepository: context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            firebaseAuth: context.read(),
            userService: context.read(),
          )..loadListener(),
          lazy: false,
        )
      ],
      child: const AppWidget(),
    );
  }
}
