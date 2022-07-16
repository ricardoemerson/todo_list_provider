import 'package:flutter/material.dart';

import '../../../core/theme/theme_extension.dart';
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
            children: const [
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
            ],
          ),
        ),
      ],
    );
  }
}
