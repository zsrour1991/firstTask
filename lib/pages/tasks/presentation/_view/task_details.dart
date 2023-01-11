import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/task_card.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/task_details_card.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.lightTextColor,
      body: Consumer(
        builder: (context,watch,_){
          final taskSelector=watch.watch(selectorTaskProvider.notifier).state;
          return TaskDetailsCard(taskModel: taskSelector);
        },
      ),
    );
  }
}
