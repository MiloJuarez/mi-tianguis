import 'package:mi_tianguis/models/map_operation_interface.dart';

class AppLog implements IMapOperation {
  int id;
  String message;
  int timesRepeated;
  String threwAt;

  AppLog({
    this.id,
    this.message,
    this.timesRepeated,
    this.threwAt,
  });

  @override
  fromMap(Map<String, dynamic> map) {
    return AppLog(
      id: int.parse(map["id"]),
      message: map["message"],
      timesRepeated: int.tryParse(map["times_repeated"]),
      threwAt: map["threw_at"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    if (this.id != null) {
      map["id"] = this.id;
    }
    map["message"] = this.message;
    map["times_repeated"] = this.timesRepeated;
    map["threw_at"] = this.threwAt;

    return map;
  }
}
