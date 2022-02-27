import 'package:flutter/material.dart';
import 'package:flutter_btcticker/constants.dart';

import '../widgets/bottom_container.dart';
import '../widgets/bottom_element.dart';
import '../widgets/currency_tile.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  var selectedCurrency = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Currency'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 87,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                    alignment: WrapAlignment.start,
                    children: kCurrenciesList
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCurrency = e;
                                });
                              },
                              child: CurrencyTile(
                                e,
                                selectedCurrency == e ? true : false,
                              ),
                            ))
                        .toList()),
              )),
          Expanded(
            flex: 13,
            child: BottomContainer(
              [
                BottomElement(
                  'Done',
                  () {
                    Navigator.pop(context, selectedCurrency);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
