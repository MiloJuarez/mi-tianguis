import 'package:mi_tianguis/models/model.dart';
import 'package:mi_tianguis/models/map_operation_interface.dart';

class Category implements IModel, IMapOperation {
  int id;
  String name;
  String description;

  Category({this.id, this.name, this.description});

  @override
  Category fromMap(Map<String, String> map) {
    return new Category(
      id: int.tryParse(map[""]),
      name: map["name"],
      description: map["description"],
    );
  }

  String get getName => this.name;
  String get getDesc => this.description;

  @override
  Map<String, String> toMap() {
    Map<String, String> map = Map<String, String>();
    if (this.id > 0) {
      map["id"] = "${this.id}";
    }
    map["name"] = this.name;
    map["description"] = this.description;
    return map;
  }

  @override
  String get getTblName => "category";

  @override
  int get getId => this.id;
}
