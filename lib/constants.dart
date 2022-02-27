import 'package:flutter/material.dart';
import 'asset_pair.dart';

const kGridColumnCount = 3;

const kMaxDisplayedCoinCount = 6;

const kPrimaryColor = Colors.indigo;
const kBackgroundColor = Colors.white;
const kTextColor = Colors.black;

const kInitialCurrency = 'USD';

const kMaxCoinCodeLength = 12;

// Release version will have build-in feature to obtain API key
// For development purposes the below empty string will be replaced by the key provided by coinapi.io
const kApiKey = '';

const kInputDescriptionText =
    "Please input desired coin as abbreviation (code) into below field.";

const List<String> kCurrenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'KRW',
  'NOK',
  'NZD',
  'RUB',
  'SGD',
  'USD',
  'TRY',
];
