import 'package:bmi_calculater/shared/components/components.dart';
import 'package:bmi_calculater/shared/components/constants.dart';
import 'package:flutter/material.dart';

class NewTasks extends StatelessWidget {
  NewTasks({Key? key}) : super(key: key);

  // final List<Map> tasks = [];
  // NewTasks({
  //    this.tasks;
  // });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

      child: ListView.separated(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) => task(tasks[index]),
          separatorBuilder: (context, index)=> SizedBox(),
          itemCount: tasks.length),
    );
  }
}
