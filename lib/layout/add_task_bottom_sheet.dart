import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_data_model.dart';
import 'package:to_do_app/stayle/colors.dart';

import '../network/local/firebase_utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime? _selectedDate;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 710)),
      builder: (context, child) {
        return Center(
          child: Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: shadowBlueColor, // header & active day color
                  onPrimary: Colors.white, // text color on active day
                  onSurface: Colors.black, // default text color
                ),
                dialogBackgroundColor: Colors.white, // white background
              ),
              child: child!,
            ),
          ),
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Task",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: shadowBlueColor,
                    ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return "Please Enter Valid Title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Task title",
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: shadowBlueColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return "Please enter Valid Description";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  prefixIcon: const Icon(
                    Icons.messenger_rounded,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: shadowBlueColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Select Date",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: shadowBlueColor,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white),
                    onPressed: _pickDate,
                  ),
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No date selected"
                          : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Task task = Task(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        date: _selectedDate!);
                    addTaskToFirebase(task);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Add New Task",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: shadowBlueColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
