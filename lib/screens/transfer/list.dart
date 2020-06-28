import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, i) {
          final transfer = widget._transfers[i];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then(update);
        },
      ),
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
    );
  }

  update(Transfer value) {
    if (value == null) return;
    widget._transfers.add(value);
    setState(() {});
  }
}
