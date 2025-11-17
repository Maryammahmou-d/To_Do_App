import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message,
    {bool isCancellable = false}) {
  showDialog(
    context: context,
    barrierDismissible: isCancellable,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            width: 10,
          ),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(BuildContext context, String message, String description,
    String posBtn, VoidCallback posFun,
    {bool isCanellable = false, String? negBtn, VoidCallback? negFun}) {
  List<Widget> Actions = [
    TextButton(
        onPressed: () {
          return posFun();
        },
        child: Text(posBtn)),
  ];
  if (negBtn != null) {
    Actions.add(TextButton(onPressed: negFun, child: Text(negBtn)));
  }
  ;

  //Function == VoidCallback

  showDialog(
      context: context,
      barrierDismissible: isCanellable,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          //actions:Actions, OR
          actions: [TextButton(onPressed: posFun, child: Text(posBtn))],
        );
      });
}
