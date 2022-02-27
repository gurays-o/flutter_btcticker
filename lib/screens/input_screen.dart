import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_btcticker/constants.dart';

import 'currency_screen.dart';
import '../widgets/bottom_container.dart';
import '../widgets/bottom_element.dart';
import '../asset_pair.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final validCharacters = RegExp(r'^[a-zA-Z0-9\*]+$');
  final _inputController = TextEditingController();
  var inputPair = AssetPair('', '');

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  String _processInput(String inputText) {
    var firstList = inputText.split("");
    firstList.removeWhere((e) => !validCharacters.hasMatch(e));
    var secondList = firstList.join().toUpperCase();
    return secondList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Input Pair'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 87,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: kPrimaryColor,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 6.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 3,
                                child: const Text(
                                  'Pair:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 3.0,
                                    ),
                                    child: Card(
                                      color: kPrimaryColor.shade300,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                          '${inputPair.cryptoAsset} / ${inputPair.baseCurrency}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: kBackgroundColor,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: kPrimaryColor,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 8.0,
                          ),
                          child: Column(
                            children: [
                              Card(
                                color: kPrimaryColor,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    kInputDescriptionText,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: TextField(
                                        onChanged: (val) {
                                          setState(() {});
                                        },
                                        style: TextStyle(color: kTextColor),
                                        controller: _inputController,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: kBackgroundColor,
                                            border: OutlineInputBorder(),
                                            hintText: "For example: eth",
                                            hintStyle: TextStyle(
                                                color:
                                                    Colors.blueGrey.shade900)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: kPrimaryColor.shade700,
                                            padding: EdgeInsets.all(16.0),
                                            shape: CircleBorder(),
                                          ),
                                          onPressed: _inputController
                                                  .text.isNotEmpty
                                              ? () {
                                                  var resultString =
                                                      _processInput(
                                                          _inputController
                                                              .text);

                                                  if (resultString == '') {
                                                    null;
                                                  } else {
                                                    setState(() {
                                                      inputPair.cryptoAsset =
                                                          _processInput(
                                                              _inputController
                                                                  .text);
                                                    });
                                                  }
                                                }
                                              : null,
                                          child: const Icon(Icons.add),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: kPrimaryColor.shade300,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 14.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor.shade600),
                          onPressed: () async {
                            var newCurrency = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CurrencyScreen(),
                              ),
                            );
                            setState(() {
                              inputPair.baseCurrency = newCurrency;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 18.0,
                              horizontal: 1.0,
                            ),
                            child: Text(
                              'Pick Currency',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 13,
            child: BottomContainer(
              [
                BottomElement(
                  'Done',
                  inputPair.checkPair() == true
                      ? () {
                          var returnPair = inputPair;
                          Navigator.pop(context, returnPair);
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
