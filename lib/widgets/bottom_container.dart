import 'package:flutter/material.dart';
import 'package:flutter_btcticker/constants.dart';

class BottomContainer extends StatelessWidget {
  List<Widget> bottomElements = [];

  BottomContainer(this.bottomElements);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.shade300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: bottomElements,
      ),
    );
  }
}
