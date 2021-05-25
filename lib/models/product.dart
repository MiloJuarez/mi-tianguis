import 'model.dart';

class Product implements IModel {
  int id;
  int idCat;
  String code;
  String name;
  String description;
  String unit;
  double amount;

  Product({
    id,
    idCat,
    this.code,
    this.name,
    this.description,
    this.unit,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int get getIdCat => this.idCat;
  String get getCode => this.code;
  String get getName => this.name;
  String get getDesc => this.description;
  String get getUnit => this.unit;
  double get getAmount => this.amount;
  String get getCreated => this.createdAt;
  String get getUpdated => this.updatedAt;

  @override
  Product fromMap(Map<String, dynamic> map) {
    return new Product(
      id: int.tryParse(map["id"]),
      idCat: int.tryParse(map["id_cat"]),
      code: map["code"],
      name: map["name"],
      description: map["description"],
      unit: map["unit"],
      amount: double.tryParse(map["amount"]),
      createdAt: map["created_at"],
      updatedAt: map["updated_at"],
      deletedAt: map["deleted_at"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    map["id"] = "${this.id}";
    map["id_cat"] = "${this.idCat}";
    map["code"] = this.code;
    map["name"] = this.name;
    map["description"] = this.description;
    map["unit"] = this.unit;
    map["amount"] = "${this.amount}";
    map["created_at"] = this.createdAt;
    map["updated_at"] = this.updatedAt;
    map["deleted_at"] = this.deletedAt;
    return map;
  }

  @override
  int get getId => this.id;

  @override
  String get getTblName => "product";

  @override
  String createdAt;

  @override
  String deletedAt;

  @override
  String updatedAt;
}
