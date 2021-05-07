class IFilterOperation<T> {
  Future<List<T>> getAll() async => [];
  // ignore: missing_return
  Future<T> getById(int id) async {}
}
