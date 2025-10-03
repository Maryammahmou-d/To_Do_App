import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/settings/settings_tab.dart';
import '../modules/task_list/task_list_tab.dart';
import '../stayle/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> Tabs = [TasksListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.white,
            width: 2,
          )),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 20,
                  ),
                  label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 20,
                  ),
                  label: "Settings")
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
          ),
        ),
        body: Tabs[currentIndex],
      ),
    );
  }
}
