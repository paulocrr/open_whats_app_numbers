import 'package:open_whats_app_numbers/local_models/whats_app_number.dart';
import 'package:open_whats_app_numbers/objectbox/objectbox.g.dart';
import 'package:open_whats_app_numbers/repositories/base_repository.dart';

class WaNumbersRepository
    extends BaseRepository<Box<WhatsAppNumber>, WhatsAppNumber> {
  WaNumbersRepository(super.box);
}
