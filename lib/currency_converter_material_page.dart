import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController texteditingcontroller = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(texteditingcontroller.text) * 30;
    });
  }

  @override
  void dispose() {
    texteditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.zero,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} Baht",
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onSubmitted: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                controller: texteditingcontroller,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  hint: const Text("Type your number here"),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  convert();
                },

                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
