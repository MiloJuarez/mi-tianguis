import 'package:mi_tianguis/models/model.dart';

class IFilterOperation<T> {
  Future<List<T>> getAll(IModel iModel) async => [];
  // ignore: missing_return
  Future<T> getById(int id, IModel iModel) async {}
}
