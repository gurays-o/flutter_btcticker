import 'package:flutter/material.dart';
import 'package:flutter_btcticker/constants.dart';

class CurrencyTile extends StatelessWidget {
  String tileChild;
  bool isSelected;

  CurrencyTile(this.tileChild, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 3.0,
      ),
      child: Card(
        color: isSelected == false
            ? kPrimaryColor.shade600
            : kPrimaryColor.shade300,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 80,
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 6.0,
          ),
          child: Text(
            tileChild,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kBackgroundColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
