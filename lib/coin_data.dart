import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

class CoinData {
  Future<double> getCoinData(String idAsset, String idBase) async {
    var url =
        Uri.parse('https://rest.coinapi.io/v1/exchangerate/$idAsset/$idBase');
    var headers = {'X-CoinAPI-Key': kApiKey};
    var response = await http.get(url, headers: headers);
    double coinRate = jsonDecode(response.body)['rate'];
    coinRate = double.parse(coinRate.toStringAsFixed(2));
    return coinRate;
  }
}
