import 'package:flutter/material.dart';

class MtStyles {
  static Center titleBold(String text) {
    return Center(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "CaveatBold",
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }

  static Text subtitleMedium(String text, BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: "CaveatMedium",
        color: Colors.white,
        fontSize: 20.0,
      ),
    );
  }

  static Text contentRegular(String text, BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: "CaveatRegular",
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }

  static ButtonStyle buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      primary: Theme.of(context).primaryColor,
      minimumSize: Size(80.0, 30.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shadowColor: Colors.black,
      onSurface: Colors.white,
      animationDuration: Duration(milliseconds: 1500),
      side: BorderSide(color: Colors.white),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }
}
