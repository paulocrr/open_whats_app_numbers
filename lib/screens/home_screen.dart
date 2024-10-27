import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_whats_app_numbers/providers/home_screen_controller.dart';
import 'package:open_whats_app_numbers/router/routes.dart';
import 'package:open_whats_app_numbers/screens/whats_app_web_browser_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveNumbers = ref.watch(homeScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whats App Numbers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addNumber);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) {
          final saveNumber = saveNumbers[index];
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    ref
                        .read(homeScreenControllerProvider.notifier)
                        .deleteNumber(
                          saveNumber.id,
                        );
                  },
                  label: 'Delete',
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            child: ListTile(
              title: Text(saveNumber.description),
              subtitle: Text(saveNumber.number),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WhatsAppWebBrowserScreen(
                      number: saveNumber.number,
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: saveNumbers.length,
      ),
    );
  }
}
