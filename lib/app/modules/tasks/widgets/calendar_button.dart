import 'package:flutter/material.dart';

import '../../../core/theme/theme_extension.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.today, color: Colors.grey),
          Text(
            'SELECIONE UMA DATA',
            style: context.titleStyle,
          ),
        ],
      ),
    );
  }
}