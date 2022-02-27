import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/price_screen.dart';
import 'constants.dart';
import 'asset_pair.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  var initialAssetPair = AssetPair('BTC', 'USD');
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
            color: kPrimaryColor.shade600,
          )),
      home: PriceScreen(initialAssetPair),
    );
  }
}
