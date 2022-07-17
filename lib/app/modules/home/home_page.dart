import 'package:flutter/material.dart';

import '../../core/notifiers/default_listener_notifier.dart';
import '../../core/theme/theme_extension.dart';
import '../../data/enums/task_filter_enum.dart';
import '../tasks/tasks_module.dart';
import 'home_controller.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

class HomePage extends StatefulWidget {
  final HomeController _controller;

  const HomePage({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    DefaultListenerNotifier(changeNotifier: widget._controller).listener(
      context: context,
      successCalback: (notifier, listenerInstance) {
        listenerInstance.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._controller.loadTotalTasks();
      widget._controller.findTasks(filter: TaskFilterEnum.today);
    });
  }

  Future<void> _goToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(parent: animation, curve: Curves.easeInQuad);

          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/tasks/create', context);
        },
      ),
    );

    widget._controller.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAFBFE),
        iconTheme: IconThemeData(color: context.primaryColor, size: 32),
        actions: [
          PopupMenuButton(
            onSelected: (value) => widget._controller.showOrHideFinishedTasks(),
            icon: const Icon(
              Icons.filter_alt,
              size: 32,
            ),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(
                value: true,
                child: Text(
                  '${widget._controller.showFinishedTasks ? 'Esconder' : 'Mostrar'} tarefas concluídas',
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAFBFE),
      drawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateTask(context),
        backgroundColor: context.primaryColor,
        child: const Icon(Icons.add),
      ),
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
