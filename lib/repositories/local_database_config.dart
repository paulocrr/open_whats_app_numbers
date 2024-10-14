import 'package:open_whats_app_numbers/objectbox/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class LocalDatabaseConfig {
  late final Store store;

  Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();

    store = await openStore(directory: p.join(docsDir.path, "numbers-db"));
  }
}
