import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController texteditingcontroller = TextEditingController();

  void convert() {
    setState(() {
      double? number = double.tryParse(texteditingcontroller.text);
      if (number == null) {
        result = 0;
      } else {
        result = number * 30;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency Converter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: CupertinoColors.systemGrey3,
      ),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} Baht",
                  style: const TextStyle(
                    fontSize: 50,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CupertinoTextField(
                  controller: texteditingcontroller,
                  style: const TextStyle(color: CupertinoColors.black),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: BoxBorder.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  placeholder: "put your number here",
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed: () {
                    convert();
                  },
                  color: CupertinoColors.black,
                  child: const Text("Convert"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
