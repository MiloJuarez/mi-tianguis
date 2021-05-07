import 'package:flutter/material.dart';
import 'package:mi_tianguis/models/shopping_list.dart';
import 'dart:math';
import 'package:mi_tianguis/utils/styles.dart';

class MtCardShoppingList extends StatefulWidget {
  final String listTitle;
  final ShoppingList shoppingList;
  const MtCardShoppingList({@required this.listTitle, @required this.shoppingList, Key key})
      : super(key: key);
  @override
  _MtCardShoppingListState createState() => _MtCardShoppingListState();
}

class _MtCardShoppingListState extends State<MtCardShoppingList> {
  @override
  Widget build(BuildContext context) {
    double tamSide = (MediaQuery.of(context).size.width / 2) - 10;
    int imgNum = Random().nextInt(2);
    String imgName = imgNum > 0
        ? "assets/imgs/shopping_list.png"
        : "assets/imgs/shopping_list_reverse.png";
    return Container(
      width: tamSide,
      height: tamSide,
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage(widget.shoppingList.getBgImg),
          image: AssetImage(imgName),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: TextStyleds.subtitleMedium(widget.listTitle, context),
          ),
        ],
      ),
    );
  }
}
