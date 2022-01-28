import 'package:flutter/material.dart';

class NumberSelectButton extends StatelessWidget {
  final dynamic callback;
  String label;
  bool active;

  NumberSelectButton({@required this.callback, this.label = " ", this.active = true }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: active ? MaterialStateProperty.all<Color>(Colors.blue) : MaterialStateProperty.all<Color>(Colors.grey),
        backgroundColor: active ? MaterialStateProperty.all<Color>(Colors.blue) : MaterialStateProperty.all<Color>(Colors.grey),
      ),
      onPressed: callback, 
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width / 15, decoration: !active ? TextDecoration.lineThrough : null),
        ),
      )
      );

  }
}