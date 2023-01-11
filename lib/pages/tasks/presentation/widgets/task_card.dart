import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/_view/tasks_page.dart';
import 'package:task_list_app/pages/tasks/presentation/controller/task_controller_imp.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/date_card.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/title_card.dart';
import 'package:task_list_app/service/network_service.dart';

class TaskCard extends ConsumerWidget  {
  final TaskModel task;
  final Function callBack;
  const TaskCard({Key? key,required this.task,required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    FontWeight fontWeight=FontWeight.normal;
    return
      GestureDetector(
          onTap: (){
            fontWeight=FontWeight.bold;
           callBack();
          },
          child:
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:Colors.grey[300]
            ),
            child: Padding(padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150,
                      child: TitleCard(
                          title: task.title!, fontWeight: fontWeight)),
                  DateCard(date: task.dateTime!,)
                ],
              ),
            ),
          ));
  }
}

