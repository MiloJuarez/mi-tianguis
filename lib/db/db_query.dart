import 'package:mi_tianguis/models/filter_operation_interface.dart';
import 'package:mi_tianguis/models/filter_product_interface.dart';

class DBQuery<T> implements IFilterOperation, IFilterProduct {
  @override
  Future<List<T>> getAll() {}

  @override
  Future<T> getById(int id) {
    String dbName = T.noSuchMethod(Invocation.method(Symbol("getTblName"), []));
  }

  @override
  Future<List<T>> getByCatId(int idCat) {
    String dbName = T.noSuchMethod(Invocation.method(Symbol("getTblName"), []));
  }
}
