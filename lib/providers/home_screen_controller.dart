import 'package:open_whats_app_numbers/dependency_injection/dependency_injection.dart';
import 'package:open_whats_app_numbers/local_models/whats_app_number.dart';
import 'package:open_whats_app_numbers/repositories/wa_numbers_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  List<WhatsAppNumber> build() {
    return getIt<WaNumbersRepository>().getAll();
  }

  void deleteNumber(int numberId) {
    getIt<WaNumbersRepository>().remove(numberId);
    state = getIt<WaNumbersRepository>().getAll();
  }
}
