import 'package:get_it/get_it.dart';
import 'package:open_whats_app_numbers/local_models/whats_app_number.dart';
import 'package:open_whats_app_numbers/repositories/local_database_config.dart';
import 'package:open_whats_app_numbers/repositories/wa_numbers_repository.dart';

final getIt = GetIt.instance;

Future<void> dependencyInjectionSetup() async {
  getIt.registerSingletonAsync<LocalDatabaseConfig>(() async {
    final localDatabaseConfig = LocalDatabaseConfig();
    await localDatabaseConfig.init();
    return localDatabaseConfig;
  });
  await getIt.allReady();
  getIt.registerSingleton<WaNumbersRepository>(WaNumbersRepository(
    getIt<LocalDatabaseConfig>().store.box<WhatsAppNumber>(),
  ));
}
