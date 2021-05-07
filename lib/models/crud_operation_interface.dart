import 'package:mi_tianguis/models/map_operation_interface.dart';

class ICrudOperation<T> {
  // ignore: missing_return
  T insert(IMapOperation operation) {}
  // ignore: missing_return
  T update(IMapOperation operation) {}
  // ignore: missing_return
  int delete(T t) {}
  // ignore: missing_return
  int erase(T t) {}
}
