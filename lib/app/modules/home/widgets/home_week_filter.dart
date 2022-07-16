import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_extension.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'DIA DA SEMANA',
          style: context.titleStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 95,
          child: DatePicker(
            DateTime.now(),
            locale: 'pt_BR',
            initialSelectedDate: DateTime.now(),
            selectionColor: context.primaryColor,
            daysCount: 7,
            dayTextStyle: const TextStyle(fontSize: 13),
            monthTextStyle: const TextStyle(fontSize: 8),
            dateTextStyle: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
