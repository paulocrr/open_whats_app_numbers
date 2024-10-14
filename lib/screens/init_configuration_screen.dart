import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:open_whats_app_numbers/providers/init_configuration_provider.dart';
import 'package:open_whats_app_numbers/screens/error_screen.dart';
import 'package:open_whats_app_numbers/screens/home_screen.dart';
import 'package:open_whats_app_numbers/screens/loading_screen.dart';

class InitConfigurationScreen extends ConsumerWidget {
  const InitConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initConfigurationProvider).when(
          skipLoadingOnRefresh: false,
          data: (_) {
            return const HomeScreen();
          },
          error: (_, __) {
            return ErrorScreen(
              message: 'Error initializing configuration',
              onRetry: () {
                ref.invalidate(initConfigurationProvider);
              },
            );
          },
          loading: () {
            return const LoadingScreen();
          },
        );
  }
}
