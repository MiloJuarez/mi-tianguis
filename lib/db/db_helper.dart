import 'package:mi_tianguis/models/crud_operation_interface.dart';
import 'package:mi_tianguis/models/map_operation_interface.dart';

class DBHelper<T> implements ICrudOperation {
  static DBHelper _dbHelper;
  static DBHelper get dbHelper {
    return _dbHelper ?? (_dbHelper = DBHelper._instance());
  }

  DBHelper._instance();

  @override
  int delete(t) => 0;

  @override
  int erase(t) => 0;

  @override
  insert(IMapOperation operation) {}

  @override
  update(IMapOperation operation) {}
}
