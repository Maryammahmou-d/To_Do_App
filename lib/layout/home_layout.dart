import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Provider/Home_Provider/home_layout_provider.dart';
import 'package:to_do_app/layout/add_task_bottom_sheet.dart';
import 'package:to_do_app/modules/settings/settings_tab.dart';
import 'package:to_do_app/stayle/colors.dart';
import '../modules/task_list/task_list_tab.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "Home";

  HomeLayout({super.key});

  List<Widget> tabs = [TasksListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeLayoutProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeLayoutProvider>(context);
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            backgroundColor: backgroundColor,
            appBar: AppBar(
              //toolbarHeight: 100,
              //toolbarHeight: MediaQuery.of(context).size.height * 0.2,
              title: Text(
                "To Do List",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal[50],
              shape: const StadiumBorder(
                  side: BorderSide(
                color: Colors.white,
                width: 2,
              )),
              onPressed: () {
                showAddTaskBottomSheet(context);
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.teal[50],
              notchMargin: 8,
              shape: const CircularNotchedRectangle(),
              child: BottomNavigationBar(
                elevation: 0.0,
                type: BottomNavigationBarType.shifting,
                items: const [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(
                        Icons.list,
                        size: 22,
                      ),
                      label: "Tasks"),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(
                        Icons.settings,
                        size: 22,
                      ),
                      label: "Settings")
                ],
                currentIndex: provider.currentIndex,
                onTap: (index) {
                  provider.changeCurrentIndex(index);
                },
              ),
            ),
            body: tabs[provider.currentIndex],
          ),
        );
      },
    );
  }

  void showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddTaskBottomSheet(),
          );
        });
  }
}
