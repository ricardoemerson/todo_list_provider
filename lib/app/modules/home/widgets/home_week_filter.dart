import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_extension.dart';
import '../../../data/enums/task_filter_enum.dart';
import '../home_controller.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
        (controller) => controller.selectedFilter == TaskFilterEnum.week,
      ),
      child: Column(
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
            child: Selector<HomeController, DateTime>(
                selector: (context, controller) =>
                    controller.initialDateOfWeek ?? DateTime.now(),
                builder: (_, value, __) {
                  return DatePicker(
                    value,
                    locale: 'pt_BR',
                    initialSelectedDate: value,
                    selectionColor: context.primaryColor,
                    daysCount: 7,
                    dayTextStyle: const TextStyle(fontSize: 13),
                    monthTextStyle: const TextStyle(fontSize: 8),
                    dateTextStyle: const TextStyle(fontSize: 13),
                    onDateChange: (selectedDate) =>
                        context.read<HomeController>().filterByDay(selectedDate),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
