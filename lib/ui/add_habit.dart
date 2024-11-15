
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonalee_app/data/habit_data.dart';

import '../repos/hive_repo.dart';

class AddHabitScreen extends ConsumerStatefulWidget {
  const AddHabitScreen({super.key});

  @override
  ConsumerState<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends ConsumerState<AddHabitScreen> {
  TextEditingController habitId = TextEditingController();
  TextEditingController habitName = TextEditingController();
  TextEditingController habitFrequency = TextEditingController();
  TextEditingController habitType = TextEditingController();
  TextEditingController habitCategory = TextEditingController();
  TextEditingController habitNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
 var channel = const MethodChannel('ToastMethod');
    showToast(String msg) {
      channel.invokeMethod('ShowToast',  msg);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Habits'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: habitId,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit id',
                        hintText: 'Enter habit id',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: habitName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit Name',
                        hintText: 'Enter Habit Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: habitFrequency,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit Frequency ',
                        hintText: 'Enter Habit Frequency',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: habitType,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit Type',
                        hintText: 'Enter Habit Type',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                  
                      controller: habitCategory,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit Category',
                        hintText: 'Enter Habit Category',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: habitNote,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Habit Note',
                        hintText: 'Enter Habit Note',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Add Habit'),
                    onPressed: () {
                      var habit = HabitData(
                  
                         id: habitId.text.toString(),
                          habitName: habitFrequency.text.toString(),
                          targetFrequency: habitFrequency.text.toString(),
                          habitCategory: habitCategory.text.toString(),
                          habitType: habitType.text.toString(),
                          completionRate: habitType.text.toString(),
                        );

                      ref.read(hiveRepoProvider).addHabitToHive(habit);
                      showToast('Habit Added');
                    },
                  )
                ],
              )),
        ));
  }
}
