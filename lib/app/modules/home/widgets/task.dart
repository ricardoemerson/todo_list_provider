import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/models/task_model.dart';
import '../home_controller.dart';

class Task extends StatelessWidget {
  final TaskModel taskModel;
  final dateFormat = DateFormat('dd/MM/y');

  Task({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.grey.shade300),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 2, bottom: 8, left: 8, right: 8),
          leading: Checkbox(
            onChanged: (value) =>
                context.read<HomeController>().checkOrUncheckTask(taskModel),
            value: taskModel.done,
          ),
          title: Text(
            taskModel.description,
            style: TextStyle(
              decoration: taskModel.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFormat.format(taskModel.dateTime),
            style: TextStyle(
              decoration: taskModel.done ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 2),
          ),
        ),
      ),
    );
  }
}
