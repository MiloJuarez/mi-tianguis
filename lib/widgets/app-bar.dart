import 'package:flutter/material.dart';
import 'package:mi_tianguis/utils/styles.dart';

class MtAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: TextStyleds.titleBold("Mi Tianguis - Lista de compras"),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 10.0),
            spreadRadius: 2.0,
          ),
        ],
        color: Color.fromRGBO(2, 51, 102, 1),
      ),
    );
  }
}
