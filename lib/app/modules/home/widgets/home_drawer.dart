import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/helpers/message.dart';
import '../../../core/theme/theme_extension.dart';
import '../../../data/providers/auth/auth_provider.dart';
import '../../../data/services/task/i_task_service.dart';
import '../../../data/services/user/i_user_service.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final nameVN = ValueNotifier<String>('');
  final _nameFN = FocusNode();

  Future<void> removeTasksAndLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Deseja sair',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Deseja sair do Todo List e remover todas as suas tarefas registradas?',
            style: TextStyle(
              fontSize: 16,
              height: 1.2,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await context.read<ITaskService>().removeAllTasks();

                if (!mounted) return;
                context.read<AuthProvider>().logout();

                Navigator.of(context).pop();
              },
              child: const Text(
                'SIM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'NÃO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        'https://w7.pngwing.com/pngs/223/244/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-rectangle-black.png';
                  },
                  builder: (_, value, __) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30,
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      selector: (context, authProvider) {
                        return authProvider.user?.displayName ?? 'Não informado';
                      },
                      builder: (_, value, __) {
                        return Text(
                          value,
                          style: context.textTheme.subtitle2,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  _nameFN.requestFocus();
                  return AlertDialog(
                    title: const Text('Alterar Nome'),
                    content: TextField(
                      focusNode: _nameFN,
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final name = nameVN.value;

                          if (name.isEmpty) {
                            Message.of(context).showError('Nome obrigatório!');
                          } else {
                            await context.read<IUserService>().updateDisplayName(name);

                            if (!mounted) return;

                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Alterar'),
                      ),
                    ],
                  );
                },
              );
            },
            title: const Text('Alterar Nome'),
          ),
          ListTile(
            onTap: () async {
              await removeTasksAndLogout(context);
            },
            title: const Text('Sair'),
          )
        ],
      ),
    );
  }
}
