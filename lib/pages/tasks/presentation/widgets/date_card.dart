import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/helper/date_helper.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/controller/task_controller_imp.dart';
import 'package:task_list_app/service/network_service.dart';
class  DateCard extends StatelessWidget {
  final DateTime date;

  const DateCard({super.key, required this.date});
  @override
  Widget build(BuildContext context) {
    return Text(DateHelper.getFormatDDMM(date),
      style: TextStyle(color: Colors.grey[500],fontSize: 12),);
  }
}

