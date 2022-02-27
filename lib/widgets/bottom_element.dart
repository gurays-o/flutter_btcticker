import 'package:flutter/material.dart';
import 'package:flutter_btcticker/constants.dart';

class BottomElement extends StatelessWidget {
  String activeLabel;
  VoidCallback? funcHandler;

  BottomElement(this.activeLabel, this.funcHandler);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 14.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: kPrimaryColor.shade600),
          onPressed: funcHandler,
          child: Text(
            activeLabel,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
