import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/controller/task_controller_imp.dart';
import 'package:task_list_app/service/network_service.dart';
class  DescriptionCard extends StatelessWidget {
  final String? description;


  const DescriptionCard({super.key,required this.description});
  @override
  Widget build(BuildContext context) {
    return Text(description!,
      style: TextStyle(color: Colors.black,fontSize: 14,),);
  }
}

