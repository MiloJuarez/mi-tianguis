import 'package:flutter/material.dart';
import 'package:mi_tianguis/screens/MainScreen.dart';
import 'package:mi_tianguis/utils/default-app-theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultAppTheme.get(),
      home: MainScreen(title: "Mi Tianguis"),
      debugShowCheckedModeBanner: false,
    );
  }
}
