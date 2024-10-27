import 'package:open_whats_app_numbers/dependency_injection/dependency_injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'init_configuration_provider.g.dart';

@riverpod
Future<void> initConfiguration(InitConfigurationRef ref) async {
  await dependencyInjectionSetup();
}
