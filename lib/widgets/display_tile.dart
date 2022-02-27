import 'package:flutter/material.dart';
import 'package:flutter_btcticker/constants.dart';

class DisplayTile extends StatelessWidget {
  String tileBody;
  Color tileColor;

  DisplayTile(this.tileBody, this.tileColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        12.0,
        10.0,
        12.0,
        4.0,
      ),
      child: Card(
        color: tileColor,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 17.0,
              horizontal: 13.0,
            ),
            child: Text(
              tileBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kBackgroundColor,
                fontSize: 20.0,
              ),
            )),
      ),
    );
  }
}
