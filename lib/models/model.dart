import 'package:mi_tianguis/models/map_operation_interface.dart';

class IModel implements IMapOperation {
  String get getTblName => "";
  int get getId => 0;
  String createdAt;
  String updatedAt;
  String deletedAt;

  @override
  fromMap(Map<String, dynamic> map) {}

  @override
  Map<String, dynamic> toMap() {}
}
