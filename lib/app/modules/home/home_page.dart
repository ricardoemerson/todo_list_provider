import 'package:flutter/material.dart';

import '../../core/theme/theme_extension.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAFBFE),
        iconTheme: IconThemeData(color: context.primaryColor, size: 32),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.filter_alt,
              size: 32,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem<bool>(
                child: Text(
                  'Mostrar tarefas concluídas',
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAFBFE),
      drawer: const HomeDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
