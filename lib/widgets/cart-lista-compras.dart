import 'package:flutter/material.dart';
import 'package:mi_tianguis/models/shopping_list.dart';
import 'package:mi_tianguis/utils/styles.dart';

class MtCardShoppingList extends StatefulWidget {
  final ShoppingList shoppingList;
  const MtCardShoppingList({
    @required this.shoppingList,
    Key key,
  }) : super(key: key);
  @override
  _MtCardShoppingListState createState() => _MtCardShoppingListState();
}

class _MtCardShoppingListState extends State<MtCardShoppingList> {
  @override
  Widget build(BuildContext context) {
    double tamSide = (MediaQuery.of(context).size.width / 2) - 10;
    return Container(
      width: tamSide,
      height: tamSide,
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage(widget.shoppingList.getBgImg),
          image: AssetImage(widget.shoppingList.backgroundImg),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: MtStyles.subtitleMedium(
              widget.shoppingList.name,
              context,
            ),
          ),
        ],
      ),
    );
  }
}
