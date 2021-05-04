import 'package:flutter/material.dart';
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 50,
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
                MtAppBar(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> doomyWidgets(BuildContext context) {
    List<Widget> lstDommyConts = [];
    for (int i = 0; i < 20; i++) {
      lstDommyConts.add(MtCardListaCompra(listTitle: "Shooping list $i"));
    }
    return lstDommyConts;
  }
}
