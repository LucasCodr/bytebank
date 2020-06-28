import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[900],
        accentColor: Colors.teal[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransferList(),
    );
  }
}
