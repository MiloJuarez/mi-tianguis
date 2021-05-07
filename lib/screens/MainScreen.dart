import 'package:flutter/material.dart';
import 'package:mi_tianguis/models/shopping_list.dart';
import 'package:mi_tianguis/widgets/app-bar.dart';
import 'package:mi_tianguis/widgets/cart-lista-compras.dart';

class MainScreen extends StatefulWidget {
  final String title;
  const MainScreen({@required this.title, Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  ListView _body(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 75,
              margin: EdgeInsets.only(top: 55.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/cutting_board.jpg"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                ),
              ),
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: doomyWidgets(context),
              ),
            ),
            MtAppBar()
          ],
        ),
      ],
    );
  }

  List<Widget> doomyWidgets(BuildContext context) {
    List<Widget> lstDommyConts = [];
    for (int i = 0; i < 5; i++) {
      ShoppingList _shoppingLst =
          ShoppingList(backgroundImg: "assets/imgs/shopping_list.png");
      lstDommyConts.add(MtCardShoppingList(
        listTitle: "Shooping list $i",
        shoppingList: _shoppingLst,
      ));
    }
    return lstDommyConts;
  }
}
