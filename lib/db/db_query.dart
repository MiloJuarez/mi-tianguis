import 'dart:convert';
import 'package:mi_tianguis/db/db.dart';
import 'package:mi_tianguis/models/filter_operation_interface.dart';
import 'package:mi_tianguis/models/filter_product_interface.dart';
import 'package:mi_tianguis/models/model.dart';
import 'package:sqflite/sqflite.dart';

class DBQuery<T> implements IFilterOperation, IFilterProduct {
  /* static DBQuery _qInstance;

  DBQuery._instance();

  static DBQuery get instance => DBQuery();

  factory DBQuery() {
    return _qInstance ?? (_qInstance = DBQuery._instance());
  } */

  Future<Batch> _getBatch() async {
    Database _db = await AppDB.getDB;
    Batch batch = _db.batch();
    return batch;
  }

  @override
  Future<List<T>> getAll(IModel iModel) async {
    Batch batch = await _getBatch();
    batch.query(iModel.getTblName);
    List<dynamic> _lstRawResult = await batch.commit();
    List<T> _lstT = [];
    List<dynamic> _lstRawModel = json.decode(json.encode(_lstRawResult.first));
    _lstRawModel.forEach((_rawModel) => _lstT.add(iModel.fromMap(_rawModel)));
    return _lstT;
  }

  @override
  Future<T> getById(int id, IModel iModel) async {
    T t;
    Batch batch = await _getBatch();
    batch.query(
      iModel.getTblName,
      where: "id = ?",
      whereArgs: [id],
    );
    List<dynamic> _lstRawResult = await batch.commit();
    List<dynamic> _lstRawModel = json.decode(json.encode(_lstRawResult.first));
    t = iModel.fromMap(_lstRawModel.first);
    return t;
  }

  @override
  Future<List<T>> getByCatId(int idCat, IModel iModel) async {
    Batch batch = await _getBatch();
    batch.query(
      iModel.getTblName,
      where: "id_cat = ?",
      whereArgs: [idCat],
    );
    List<T> _lstT = [];
    List<dynamic> _lstRawResult = await batch.commit();
    List<dynamic> _lstRawModel = json.decode(json.encode(_lstRawResult.first));
    _lstRawModel.forEach((_rawModel) => _lstT.add(iModel.fromMap(_rawModel)));
    return _lstT;
  }
}
