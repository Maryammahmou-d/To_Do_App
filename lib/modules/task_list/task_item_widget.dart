import 'package:flutter/material.dart';
import 'package:to_do_app/stayle/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
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
                    "Task Title",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Task Day",
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
    );
  }
}
