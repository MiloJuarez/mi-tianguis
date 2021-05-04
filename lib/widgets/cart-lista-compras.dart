import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mi_tianguis/utils/styles.dart';

class MtCardListaCompra extends StatefulWidget {
  final String listTitle;
  // final ShoppingList shoppingList;
  const MtCardListaCompra({@required this.listTitle, Key key})
      : super(key: key);
  @override
  _MtCardListaCompraState createState() => _MtCardListaCompraState();
}

class _MtCardListaCompraState extends State<MtCardListaCompra> {
  @override
  Widget build(BuildContext context) {
    double tamSide = (MediaQuery.of(context).size.width / 2) - 10;
    int imgNum = Random().nextInt(2);
    print("Random num: $imgNum");
    String imgName = imgNum > 0
        ? "assets/imgs/shopping_list.png"
        : "assets/imgs/shopping_list_reverse.png";
    return Container(
      width: tamSide,
      height: tamSide,
      decoration: BoxDecoration(
        image: DecorationImage(
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
