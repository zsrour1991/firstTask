import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/_view/task_details.dart';
import 'package:task_list_app/pages/tasks/presentation/controller/task_controller_imp.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/task_card.dart';
import 'package:task_list_app/service/network_service.dart';

final taskProvider = FutureProvider<List<TaskModel>>(
      (ref) async => TaskControllerImp().getTask(),

);
class TasksPage extends ConsumerWidget  {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final taskList = ref.watch(taskProvider);
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyle.lightTextColor,
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0,right: 20,top: 60),
          child: Column(
            children: [
              Row(
                children: [
                  Container(width: 15,),
                  Text(tr("Tasks"),style: TextStyle(fontSize: 18),),
                ],
              ),
              Divider(color: AppStyle.mediumBlue,thickness: 1,),
              Container(height: 15,),
              taskList.when(
                    data: (data) {
                      if(data==null){return Container();}else{
                     List<TaskModel>? taskModel = data.map((e) => e).toList();
                      return  ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: taskModel.length,
                        itemBuilder: (_,index){
                          return Padding(
                            padding:  EdgeInsets.only(bottom: 8.0),
                            child: TaskCard(
                              task: taskModel[index],
                            callBack: (){
                              ref.read(selectorTaskProvider.notifier).state=taskModel[index];
                              context.beamToNamed('/task');
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetails()));
                            },),
                          );
                        });
                      }},
                    error: (e, stack) => Text('Error: $e'),
                    loading: () => const CircularProgressIndicator(),
              ),
            ],
          ),
        ));
  }
}
