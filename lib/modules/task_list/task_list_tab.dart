import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:to_do_app/stayle/colors.dart';

class TasksListTab extends StatelessWidget {
  const TasksListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030, 1, 1),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.teal[50],
          dayColor: Colors.teal[50],
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotColor: Colors.blueGrey,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
      ],
    );
  }
}
