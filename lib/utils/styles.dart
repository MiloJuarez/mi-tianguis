import 'package:flutter/material.dart';

class TextStyleds {
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
        color: Theme.of(context).primaryColor,
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
        color: Theme.of(context).primaryColor,
        fontSize: 18.0,
      ),
    );
  }
}
