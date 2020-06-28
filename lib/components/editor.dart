import 'package:flutter/material.dart';

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
