import 'package:flutter/material.dart';

import '../../../core/theme/theme_extension.dart';
import '../../../core/widgets/input_text.dart';
import '../../../core/widgets/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: context.primaryColor,
                size: 20,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(
                fontSize: 10,
                color: context.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: TodoListLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
              child: Column(
                children: [
                  InputText(label: 'e-Mail'),
                  const SizedBox(height: 20),
                  InputText(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  InputText(
                    label: 'Confirma Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Salvar'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
