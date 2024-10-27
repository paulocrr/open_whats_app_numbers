import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_whats_app_numbers/router/routes.dart';
import 'package:open_whats_app_numbers/screens/add_number_screen.dart';
import 'package:open_whats_app_numbers/screens/init_configuration_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open WhatsApp Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: Routes.initial,
      routes: {
        Routes.initial: (context) => const InitConfigurationScreen(),
        Routes.addNumber: (context) => const AddNumberScreen(),
      },
    );
  }
}
