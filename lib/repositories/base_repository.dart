import 'package:objectbox/objectbox.dart';

class BaseRepository<T extends Box<E>, E> {
  final T box;

  BaseRepository(this.box);

  List<E> getAll() {
    return box.getAll();
  }

  E? get(int id) {
    return box.get(id);
  }

  void put(E entity) {
    box.put(entity);
  }

  void remove(int id) {
    box.remove(id);
  }
}
