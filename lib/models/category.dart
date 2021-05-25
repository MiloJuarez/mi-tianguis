import 'package:mi_tianguis/models/model.dart';

class Category implements IModel {
  int id;
  String name;
  String description;

  Category({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  Category fromMap(Map<String, dynamic> map) {
    return new Category(
      id: int.tryParse(map[""]),
      name: map["name"],
      description: map["description"],
      createdAt: map["created_at"],
      updatedAt: map["updated_at"],
      deletedAt: map["deleted_at"],
    );
  }

  String get getName => this.name;
  String get getDesc => this.description;
  String get getCreated => this.createdAt;
  String get getUpdated => this.updatedAt;

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    if (this.id > 0) {
      map["id"] = "${this.id}";
    }
    map["name"] = this.name;
    map["description"] = this.description;
    map["created_at"] = this.createdAt;
    map["updated_at"] = this.updatedAt;
    map["deleted_at"] = this.deletedAt;
    return map;
  }

  @override
  String get getTblName => "category";

  @override
  int get getId => this.id;

  @override
  String createdAt;

  @override
  String deletedAt;

  @override
  String updatedAt;
}
