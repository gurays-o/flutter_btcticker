void main() {
  var inputText = ' ai {0sfc 5*kl';
  print(_processInput(inputText));
}

final validCharacters = RegExp(r'^[a-zA-Z0-9\*]+$');

String _processInput(String inputText) {
  var firstList = inputText.split("");
  firstList.removeWhere((e) => !validCharacters.hasMatch(e));
  var secondList = firstList.join().toUpperCase();
  return secondList;
}
