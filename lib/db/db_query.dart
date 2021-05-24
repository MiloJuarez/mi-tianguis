import 'package:mi_tianguis/models/filter_operation_interface.dart';
import 'package:mi_tianguis/models/filter_product_interface.dart';
import 'package:mi_tianguis/models/model.dart';

class DBQuery<T> implements IFilterOperation, IFilterProduct {
  static DBQuery _qInstance;

  DBQuery._instance();

  static DBQuery get instance => DBQuery();

  factory DBQuery() {
    return _qInstance ?? (_qInstance = DBQuery._instance());
  }

  @override
  Future<List<T>> getAll(IModel iModel) async {}

  @override
  Future<T> getById(int id, IModel iModel) {}

  @override
  Future<List<T>> getByCatId(int idCat, IModel iModel) {}
}
