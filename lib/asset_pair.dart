class AssetPair {
  String cryptoAsset;
  String baseCurrency;

  AssetPair(
    this.cryptoAsset,
    this.baseCurrency,
  );

  String pairLabel() {
    return '$cryptoAsset/$baseCurrency';
  }

  bool checkPair() {
    if (cryptoAsset == '' || baseCurrency == '') {
      return false;
    } else {
      return true;
    }
  }
}
