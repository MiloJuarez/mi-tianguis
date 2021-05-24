import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mi_tianguis/models/model.dart';
import 'package:mi_tianguis/models/product.dart';

class ShoppingList with ChangeNotifier implements IModel {
  int id;
  String name;
  String description;
  bool _shoppingMode = false;
  List<Product> _lstProducts;
  double subtotal;
  int timeUsed;
  String backgroundImg;
  String createdAt;
  String updatedAt;
  String deletedAt;

  ShoppingList({
    this.id = 0,
    this.name,
    this.description,
    this.subtotal = 0,
    this.timeUsed = 0,
    this.backgroundImg,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  void toggleShoppingMode() {
    this._shoppingMode = !this._shoppingMode;
  }

  set setName(String name) => this.name = name;
  set setDesc(String desc) => this.description = desc;
  void setBackImg() {
    int imgNum = Random().nextInt(2);
    String imgName = imgNum > 0
        ? "assets/imgs/shopping_list.png"
        : "assets/imgs/shopping_list_reverse.png";
    this.backgroundImg = imgName;
  }

  void setTimeUsed() {}

  double _getSubtotalApprox() {
    return 0;
  }

  void setCreated() {
    this.createdAt = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  void setUpdated() {
    this.updatedAt = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  String get getName => this.name;
  String get getDesc => this.description;
  double get getSubTotal => _getSubtotalApprox();
  int get getTimeUsed => this.timeUsed;
  String get getBgImg => this.backgroundImg;
  String get getCreated => this.createdAt;
  String get getUpdated => this.updatedAt;
  String get getDeleted => this.deletedAt;
  List<Product> get getLstProd => this._lstProducts;

  void add(Product product) {}
  void remove(Product product) {}

  @override
  ShoppingList fromMap(Map<String, String> map) {
    return ShoppingList(
      id: int.tryParse(map["id"]),
      name: map["name"],
      description: map["description"],
      subtotal: double.tryParse(map["subtotal"]),
      timeUsed: int.tryParse(map["time_used"]),
      backgroundImg: map["background_img"],
      createdAt: map["created_at"],
      updatedAt: map["updated_at"],
      deletedAt: map["deleted_at"],
    );
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map = Map<String, String>();
    if (this.id > 0) {
      map["id"] = "${this.id}";
    }
    map["name"] = this.name;
    map["description"] = this.description;
    map["subtotal"] = "${this.subtotal}";
    map["time_used"] = "${this.timeUsed}";
    map["background_img"] = this.backgroundImg;
    map["created_at"] = this.createdAt;
    map["updated_at"] = this.updatedAt;
    map["deleted_at"] = this.deletedAt;
    return map;
  }

  @override
  int get getId => this.id;

  @override
  String get getTblName => "shopping_list";
}
