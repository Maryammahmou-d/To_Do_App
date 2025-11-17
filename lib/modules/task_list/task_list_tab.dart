import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:to_do_app/modules/task_list/task_item_widget.dart';
import '../../models/task_data_model.dart';
import '../../network/local/firebase_utils.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CalendarTimeline(
          showYears: true,
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 730)),
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          leftMargin: 10,
          dayNameColor: Colors.teal,
          monthColor: Colors.teal[50],
          dayColor: Colors.teal[50],
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotColor: Colors.blueGrey,
          locale: 'en_ISO',
        ),
        StreamBuilder<QuerySnapshot<Task>>(
          stream: getTasksFromFireStore(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }
            ;
            if (snapshot.hasError) {
              return Center(child: Text("Something Wnatrong"));
            }
            ;
            var tasks =
                snapshot.data?.docs.map((task) => task.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
