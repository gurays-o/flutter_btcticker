import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_btcticker/constants.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../widgets/bottom_container.dart';
import '../widgets/bottom_element.dart';
import '../coin_data.dart';

import 'input_screen.dart';
import '../widgets/display_tile.dart';
import '../asset_pair.dart';

class PriceScreen extends StatefulWidget {
  AssetPair assetPair;

  PriceScreen(this.assetPair);
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<Widget> displayList = [];
  final coinData = CoinData();

  Future<double> _getRate(AssetPair assetPair) async {
    var coinRate = await coinData.getCoinData(
      assetPair.cryptoAsset,
      assetPair.baseCurrency,
    );
    return coinRate;
  }

  Widget _tileBuilder(AssetPair assetPair) {
    return FutureBuilder(
        future: _getRate(assetPair),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.hasData) {
            var numFormatter = NumberFormat('#,##0.00', 'en_US');
            return DisplayTile(
                '1 ${assetPair.cryptoAsset} = ${numFormatter.format(dataSnapshot.data)} ${assetPair.baseCurrency}',
                kPrimaryColor);
          } else if (dataSnapshot.hasError) {
            return DisplayTile(
                'Could not get ${assetPair.pairLabel()}', Colors.red.shade300);
          } else {
            return DisplayTile('Receiving...', Colors.yellow.shade600);
          }
        });
  }

  @override
  void initState() {
    super.initState();
    displayList.add(_tileBuilder(widget.assetPair));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Ticker'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: displayList,
              )),
          Expanded(
            flex: 13,
            child: BottomContainer(
              [
                BottomElement(
                    'Remove',
                    displayList.isNotEmpty
                        ? () {
                            setState(() {
                              displayList.removeLast();
                            });
                          }
                        : null),
                BottomElement(
                    'Add Pair',
                    displayList.length < kMaxDisplayedCoinCount
                        ? () async {
                            AssetPair newPair = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    InputScreen(),
                              ),
                            );
                            if (newPair.checkPair() == true) {
                              setState(() {
                                displayList.add(_tileBuilder(newPair));
                              });
                            }
                          }
                        : null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
