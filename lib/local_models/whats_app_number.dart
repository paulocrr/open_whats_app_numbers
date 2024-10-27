import 'package:objectbox/objectbox.dart';

@Entity()
class WhatsAppNumber {
  @Id()
  int id;
  String number;
  String description;

  WhatsAppNumber({
    this.id = 0,
    required this.number,
    required this.description,
  });
}
