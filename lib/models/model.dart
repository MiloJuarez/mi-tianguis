import 'package:mi_tianguis/models/map_operation_interface.dart';

class IModel implements IMapOperation {
  String get getTblName => "";
  int get getId => 0;

  @override
  fromMap(Map<String, String> map) {}

  @override
  Map<String, String> toMap() {}
}
