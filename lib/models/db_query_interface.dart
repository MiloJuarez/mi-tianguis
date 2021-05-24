import 'package:mi_tianguis/models/filter_operation_interface.dart';
import 'package:mi_tianguis/models/filter_product_interface.dart';
import 'package:mi_tianguis/models/model.dart';

class IDBQuery<T> implements IFilterOperation, IFilterProduct {
  @override
  Future<List<T>> getAll(IModel iModel) {}

  @override
  Future<T> getById(int id, IModel iModel) {}

  @override
  Future<List<T>> getByCatId(int idCat, IModel iModel) {}
}
