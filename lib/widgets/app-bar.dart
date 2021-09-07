import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_tianguis/utils/styles.dart';

class MtAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  MtAppBar({@required this.context});

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   title: TextStyleds.titleBold("Mi Tianguis"),
    //   backgroundColor: Theme.of(context).primaryColor,
    //   elevation: 5.0,
    // );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: MtStyles.titleBold("Mi Tianguis - Listas de compra"),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 10.0),
            spreadRadius: 2.0,
          ),
        ],
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(this.context).size.width, 50.0);
}
