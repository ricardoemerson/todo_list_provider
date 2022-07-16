import 'package:flutter/material.dart';

import '../../../core/theme/theme_extension.dart';

class TodoCardFilter extends StatefulWidget {
  const TodoCardFilter({Key? key}) : super(key: key);

  @override
  State<TodoCardFilter> createState() => _TodoCardFilterState();
}

class _TodoCardFilterState extends State<TodoCardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(color: Colors.grey.withOpacity(.8)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          const Text(
            'HOJE',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: context.primaryColorLight,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            value: 0.4,
          ),
        ],
      ),
    );
  }
}
