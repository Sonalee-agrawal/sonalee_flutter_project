
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sonalee_app/data/habit_data.dart';


class HiveRepo {


final boxName = 'habits';
  void registerAdapter() {
    Hive.registerAdapter(HabitDataAdapter());
  }


  Future addHabitToHive(HabitData habit) async {
    final expenseBox = await Hive.openBox<HabitData>(boxName);
    if (expenseBox.isOpen) {
      await expenseBox.put(habit.id, habit);
      expenseBox.close();
    } else {
      throw Exception('Box is not open');
    }
  }
 Future<List<HabitData>> getAllHabitFromHive() async {
    final expenseBox = await Hive.openBox<HabitData>(boxName);
    if (expenseBox.isOpen) {
      return expenseBox.values.toList();
    } else {
      throw Exception('Box is not open');
    }
  }

  Future<HabitData> getHabitFromHive(String id) async {
    final expenseBox = await Hive.openBox<HabitData>(boxName);
    if (expenseBox.isOpen) {
      return expenseBox.get(id) ?? HabitData();
    } else {
      throw Exception('Box is not open');
    }
  }
  
}

final hiveRepoProvider = Provider<HiveRepo>((ref) => HiveRepo());
