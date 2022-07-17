import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_extension.dart';
import '../../../data/enums/task_filter_enum.dart';
import '../../../data/models/total_tasks_model.dart';
import '../home_controller.dart';
import 'todo_card_filter.dart';

class HomeFilters extends StatefulWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              TodoCardFilter(
                label: 'HOJE',
                taskFilter: TaskFilterEnum.today,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 9,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                        (value) => value.selectedFilter) ==
                    TaskFilterEnum.today,
              ),
              TodoCardFilter(
                label: 'AMANHÃ',
                taskFilter: TaskFilterEnum.tomorrow,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 5,
                  totalTasksFinish: 4,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                        (value) => value.selectedFilter) ==
                    TaskFilterEnum.tomorrow,
              ),
              TodoCardFilter(
                label: 'SEMANA',
                taskFilter: TaskFilterEnum.week,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 17,
                  totalTasksFinish: 8,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                        (value) => value.selectedFilter) ==
                    TaskFilterEnum.week,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
