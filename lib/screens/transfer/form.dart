import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = 'Criar transferência';

const String _accountNumberLabel = 'Número da Conta';
const String _accountNumberHint = '0000';

const String _valueLabel = 'Valor da Transferência';
const String _valueHint = '0.00';

const String _confirmButtonText = 'Confirmar';

class TransferForm extends StatefulWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();

  final TextEditingController _valueController = TextEditingController();

  _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);

    final double value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final transfer = Transfer(value, accountNumber);
      Navigator.pop(context, transfer);
    }
  }

  @override
  State<StatefulWidget> createState() => TransferFormState();
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(widget._accountNumberController, _accountNumberHint,
                  _accountNumberLabel, Icons.account_balance_wallet),
              Editor(widget._valueController, _valueHint, _valueLabel,
                  Icons.monetization_on),
              RaisedButton(
                child: Text(_confirmButtonText),
                onPressed: () => widget._createTransfer(context),
              ),
            ],
          ),
        ));
  }
}
