import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sonalee_app/data/quotes.dart';
import 'package:sonalee_app/providers/quote_future_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/helpers/route_name.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Quotes>> quoteList = ref.watch(quoteFutureProvider);

    log(quoteList.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracking'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toogleTheme();
              },
              icon: const Icon(Icons.lightbulb)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hi Shree,'),
            const Text('Welcome to habits tracking app '),
            const SizedBox(
              height: 30,
            ),
            Container(
                color: Colors.amber,
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text('Quote of the day -'),
                      Text('Hard work is key to success.'),
                    ],
                  ),
                )),
            // Text(quoteList.first.toString()),

            const SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteName.methodChannelScreen);

                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const MethodChannelScreen() ));
              },
              child: const Text(' Method channel '),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteName.dashboard);
              },
              child: const Text('Habits Dashboard '),
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
