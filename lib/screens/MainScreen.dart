import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mi_tianguis/db/db_query.dart';
import 'package:mi_tianguis/models/shopping_list.dart';
import 'package:mi_tianguis/utils/styles.dart';
import 'package:mi_tianguis/widgets/app-bar.dart';
import 'package:mi_tianguis/widgets/cart-lista-compras.dart';

class MainScreen extends StatefulWidget {
  final String title;
  const MainScreen({@required this.title, Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ShoppingList> _lstShop;
  bool _reloading = false;

  @override
  void initState() {
    super.initState();
    if (_lstShop == null) {
      _lstShop = _lstShop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        child: FutureBuilder(
          future: _getLstShop(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<ShoppingList>> lstShop,
          ) {
            if (lstShop.connectionState == ConnectionState.active) {
              return loadingWidget(context);
            } else if (lstShop.hasData == false) {
              return reloadWidget(context);
            } else {
              return _body(context, lstShop.data);
            }
          },
        ),
        onRefresh: () => refresh(),
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
      ),
    );
  }

  ListView _body(BuildContext context, List<ShoppingList> lstShopping) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 75.0,
              margin: EdgeInsets.only(top: 55.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/bg.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                ),
              ),
              child: lstShopping.length > 0
                  ? GridView.count(
                      primary: false,
                      padding: EdgeInsets.all(16.0),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      children: _widgetsShopList(context, lstShopping),
                    )
                  : _noShoppingList(context),
            ),
            MtAppBar(context: context),
          ],
        ),
      ],
    );
  }

  Center loadingWidget(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
        strokeWidth: 1.3,
        semanticsLabel: "Cargando ...",
      ),
    );
  }

  Center reloadWidget(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: MtStyles.buttonStyle(context),
        onPressed: () {
          setState(() {
            _reloading = !_reloading;
            _getLstShop().then((value) => _reloading = !_reloading);
          });
        },
        child: MtStyles.subtitleMedium("Recargar", context),
      ),
    );
  }

  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2, milliseconds: 500),
      () => _getLstShop(),
    );
  }

  Future<List<ShoppingList>> _getLstShop() async {
    List<ShoppingList> lstShop =
        await DBQuery<ShoppingList>().getAll(ShoppingList());
    if (lstShop != null) {
      setState(() {
        _lstShop = lstShop;
      });
    }
    return _lstShop;
  }

  List<Widget> _widgetsShopList(
      BuildContext context, List<ShoppingList> lstShopping) {
    List<Widget> lstWidgetShop = [];
    lstShopping.forEach(
      (shopList) => lstWidgetShop.add(
        MtCardShoppingList(shoppingList: shopList),
      ),
    );
    return lstWidgetShop;
  }

  Column _noShoppingList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MtStyles.subtitleMedium("Aun no tienes listas de compra", context),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              style: MtStyles.buttonStyle(context),
              onPressed: () {},
              child: MtStyles.titleBold("Agregar lista"),
            ),
          ),
        ),
      ],
    );
  }
}
