import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../stayle/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "Home";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: greenBackgroundColor,
        appBar: AppBar(
          //toolbarHeight: 100,
          toolbarHeight: MediaQuery.of(context).size.height * 0.2,
          title: Text(
            "To Do List",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
