import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sonalee_app/data/habit_data.dart';
import 'package:sonalee_app/repos/hive_repo.dart';

import '../utils/helpers/route_name.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  List<HabitData> myHabitList = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(hiveRepoProvider).getAllHabitFromHive().then((habitList) {
        log(habitList.toString());
        setState(() {
          myHabitList = habitList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Your Habits'),
              background: Summary(),
            ),
            floating: false,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Your Habits', style: TextStyle(fontSize: 18)),
              ),
              HabitList(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Text('Habits Categories', style: TextStyle(fontSize: 18)),
              ),
              AddCategoryGrid(),
            ]),
          ),
        ],
      ),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: const Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Completed: 12/15'),
            Text('Streak: 5 days'),
            Text('"Keep up the good work!"'),
          ],
        ),
      ),
    );
  }
}

class HabitList extends StatelessWidget {
  final List<Map<String, String>> habits = [
    {"name": "Yoga", "frequency": "Daily", "category": "Fitness"},
    {"name": "walking", "frequency": "Weekly", "category": "Fitness"},
    {"name": "Swiming", "frequency": "Weekly", "category": "Fitness"},
    {"name": "Project Pro", "frequency": "Weekly", "category": "Learning"},
    {"name": "Scaller", "frequency": "Daily", "category": "Learning"},
    {"name": "Shopping", "frequency": "Monthly", "category": "Self-Care"},
    {"name": "Spa", "frequency": "Monthly", "category": "Self-Care"},
    {"name": "Yoga", "frequency": "Weekly", "category": "Learning"},
    {"name": "Office", "frequency": "Daily", "category": "Learning"},
    {"name": "Yoga", "frequency": "Weekly", "category": "Learning"},

    // Add more dummy HAbits
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return HabitCard(
          name: habits[index]["name"]!,
          frequency: habits[index]["frequency"]!,
          category: habits[index]["category"]!,
        );
      },
    );
  }
}

class AddCategoryGrid extends StatelessWidget {
  final List<String> categories = [
    'fitness',
    'Learnings ',
    'Self-Love',
    'Others'
  ];

  AddCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              context.pushNamed(RouteName.addHabit);
            },
            child: CategoryCard(category: categories[index]));
      },
    );
  }
}

class HabitCard extends StatelessWidget {
  final String name;
  final String frequency;
  final String category;

  HabitCard(
      {required this.name, required this.frequency, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('$frequency - $category'),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Text(category)),
    );
  }
}
