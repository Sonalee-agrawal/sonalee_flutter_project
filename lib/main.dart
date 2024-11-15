
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sonalee_app/providers/theme_provider.dart';
import 'package:sonalee_app/repos/hive_repo.dart';
import 'package:sonalee_app/themes/style.dart';

import 'providers/go_router_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();
  HiveRepo().registerAdapter();

  runApp(const ProviderScope(
    child: SampleApp(),
  ));

}

class SampleApp extends ConsumerStatefulWidget {
  const SampleApp({super.key});

  @override
  ConsumerState<SampleApp> createState() => _SampleAppState();
}

class _SampleAppState extends ConsumerState<SampleApp> {
  
   @override
  void initState() {
    super.initState();
    Future.microtask(() async{
      await ref.read(themeProvider.notifier).getSavedTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
     final isDarkTheme = ref.watch(themeProvider);
      final goRouterConfig = ref.watch(goRouterProvider);

    return  MaterialApp.router(
       theme: Styles.themedata(isDarkTheme: isDarkTheme),
      // home: const SplashScreen(),
      routerConfig: goRouterConfig,
    );
  }
}