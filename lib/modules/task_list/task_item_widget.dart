import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/network/local/firebase_utils.dart';
import 'package:to_do_app/shared/components/showLoad.dart';
import 'package:to_do_app/stayle/colors.dart';

import '../../models/task_data_model.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Slidable(
        startActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              deleteTaskFromFirestore(task.id);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: "Delete",
          ),
          SlidableAction(
            onPressed: (context) {
            },
            backgroundColor: Colors.blueGrey,
            icon: Icons.edit,
            label: "Edit",
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 80,
                color: blueColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      task.description,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
