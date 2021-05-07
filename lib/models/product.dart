import 'map_operation_interface.dart';
import 'model.dart';

class Product implements IModel, IMapOperation {
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
  });

  int get getIdCat => this.idCat;
  String get getCode => this.code;
  String get getName => this.name;
  String get getDesc => this.description;
  String get getUnit => this.unit;
  double get getAmount => this.amount;

  @override
  Product fromMap(Map<String, String> map) {
    return new Product(
      id: int.tryParse(map["id"]),
      idCat: int.tryParse(map["id_cat"]),
      code: map["code"],
      name: map["name"],
      description: map["description"],
      unit: map["unit"],
      amount: double.tryParse(map["amount"]),
    );
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map = Map<String, String>();
    map["id"] = "${this.id}";
    map["id_cat"] = "${this.idCat}";
    map["code"] = this.code;
    map["name"] = this.name;
    map["description"] = this.description;
    map["unit"] = this.unit;
    map["amount"] = "${this.amount}";
    return map;
  }

  @override
  int get getId => this.id;

  @override
  String get getTblName => "product";
}
