import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/controller/task_controller_imp.dart';
import 'package:task_list_app/service/network_service.dart';
class  TitleCard extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double?fontSize;

  const TitleCard({super.key,this.fontSize=12, required this.title,required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(tr(title),maxLines: 2,
      style: TextStyle(color: Colors.black,fontSize: fontSize,fontWeight: fontWeight),);
  }
}

