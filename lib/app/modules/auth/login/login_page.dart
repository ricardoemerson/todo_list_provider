import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/helpers/message.dart';
import '../../../core/notifiers/default_listener_notifier.dart';
import '../../../core/widgets/input_text.dart';
import '../../../core/widgets/todo_list_logo.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    DefaultListenerNotifier(changeNotifier: context.read<LoginController>()).listener(
      context: context,
      everCallback: (notifier, listenerInstance) {
        if (notifier is LoginController) {
          if (notifier.hasInfo) {
            Message.of(context).showInfo(notifier.infoMessage!);
          }
        }
      },
      successCalback: (notifier, listenerInstance) {
        debugPrint('Login efetuado com sucesso.');
      },
    );
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const TodoListLogo(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputText(
                            label: 'e-Mail',
                            controller: _emailEC,
                            focusNode: _emailFocus,
                            validator: Validatorless.multiple([
                              Validatorless.required('e-Mail obrigatório!'),
                              Validatorless.email('e-Mail inválido!'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          InputText(
                            label: 'Senha',
                            controller: _passwordEC,
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória!'),
                              Validatorless.min(
                                  6, 'Senha deve ter pelo menos 6 caracteres!'),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (_emailEC.text.isNotEmpty) {
                                    context
                                        .read<LoginController>()
                                        .forgotPassword(_emailEC.text);
                                  } else {
                                    _emailFocus.requestFocus();
                                    Message.of(context).showError(
                                        'Digite um e-mail para recuperar a senha!');
                                  }
                                },
                                child: const Text('Esqueceu sua senha?'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final formValid =
                                      _formKey.currentState?.validate() ?? false;

                                  if (formValid) {
                                    final email = _emailEC.text;
                                    final password = _passwordEC.text;

                                    context
                                        .read<LoginController>()
                                        .login(email, password);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Login'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F3F7),
                        border: Border(
                          top: BorderSide(
                            width: 2,
                            color: Colors.grey.withAlpha(50),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          SignInButton(
                            onPressed: () {
                              context.read<LoginController>().googleLogin();
                            },
                            Buttons.Google,
                            padding: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não tem conta?'),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pushNamed('/register'),
                                child: const Text('Cadastre-se'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
