import 'package:flutter/material.dart';

import '../../core/theme/theme_extension.dart';
import '../../core/widgets/input_text.dart';
import 'task_create_controller.dart';
import 'widgets/calendar_button.dart';

class TaskCreatePage extends StatelessWidget {
  final TaskCreateController _controller;

  const TaskCreatePage({
    Key? key,
    required TaskCreateController controller,
  })  : _controller = controller,
        super(key: key);

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
        onPressed: () {},
        backgroundColor: context.primaryColor,
        label: const Text(
          'Salvar Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
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
              InputText(label: ''),
              const SizedBox(height: 20),
              const CalendarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
