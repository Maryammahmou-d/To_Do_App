import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:to_do_app/modules/task_list/task_item_widget.dart';

class TasksListTab extends StatelessWidget {
  const TasksListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 730)),
          onDateSelected: (date) {},
          leftMargin: 10,
          dayNameColor: Colors.teal,
          monthColor: Colors.teal[50],
          dayColor: Colors.teal[50],
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotColor: Colors.blueGrey,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
