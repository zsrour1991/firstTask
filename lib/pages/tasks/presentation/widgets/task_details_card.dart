import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/date_card.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/description_card.dart';
import 'package:task_list_app/pages/tasks/presentation/widgets/title_card.dart';
class TaskDetailsCard extends StatelessWidget {
  final TaskModel? taskModel;
  const TaskDetailsCard({Key? key,required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 20.0,right: 20,top: 60),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(onTap: (){
               Beamer.of(context).beamBack();
              },
                  child:  Icon(Icons.arrow_back_ios),),
              Container(width: 15,),
              TitleCard(title: taskModel!.title!,fontWeight: FontWeight.normal,fontSize: 18,),
            ],
          ),
          Divider(color: AppStyle.mediumBlue,thickness: 1,),
          Container(height: 30,),
          Row(
            children: [
              DateCard(date: taskModel!.dateTime!),
            ],
          ),
          Container(height: 5,),
          Row(
            children: [
              Container(
                  width: size.width*0.8,
                  child: DescriptionCard(description: taskModel!.description!)),
            ],
          ),

        ],
      ),
    );
  }
}
