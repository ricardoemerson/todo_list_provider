import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/notifiers/default_listener_notifier.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/widgets/input_text.dart';
import 'task_create_controller.dart';
import 'widgets/calendar_button.dart';

class TaskCreatePage extends StatefulWidget {
  final TaskCreateController _controller;

  const TaskCreatePage({
    Key? key,
    required TaskCreateController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionEC = TextEditingController();

  @override
  void initState() {
    super.initState();

    DefaultListenerNotifier(
      changeNotifier: widget._controller,
    ).listener(
      context: context,
      successCalback: (notifier, listenerInstance) {
        listenerInstance.dispose();

        Navigator.of(context).pop();
      },
    );
  }

  @override
  void dispose() {
    _descriptionEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final formIsValid = _formKey.currentState?.validate() ?? false;

          if (formIsValid) {
            widget._controller.save(_descriptionEC.text);
          }
        },
        backgroundColor: context.primaryColor,
        label: const Text(
          'Salvar Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Criar Atividade',
                  style: context.titleStyle.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              InputText(
                label: '',
                controller: _descriptionEC,
                validator: Validatorless.required('Descrição é obrigatória!'),
              ),
              const SizedBox(height: 20),
              const CalendarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
