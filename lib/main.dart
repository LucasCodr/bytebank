import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.green[800],
          primaryColor: Colors.green[800],
          appBarTheme: AppBarTheme(color: Colors.green[800])),
      home: Scaffold(
        body: TransferList(),
      ),
    );
  }
}

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, i) {
          debugPrint('${widget._transfers[i]}');
          return TransferItem(widget._transfers[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> transfer = Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferForm()));
          transfer.then((value) {
            widget._transfers.add(value);
          });
        },
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('Valor: R\$ ${_transfer.value.toString()}'),
        subtitle: Text('Conta: ${_transfer.accountNumber}'),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar transferência'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Editor(_accountNumberController, '0000', 'Número da Conta',
                Icons.account_balance_wallet),
            Editor(_valueController, '0.00', 'Valor da Transferência',
                Icons.monetization_on),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);

    final double value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final transfer = Transfer(value, accountNumber);
      Navigator.pop(context, transfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _hint;
  final String _label;
  final IconData _icon;

  const Editor(this._controller, this._hint, this._label, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: _label,
          hintText: _hint,
          icon: Icon(_icon),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
