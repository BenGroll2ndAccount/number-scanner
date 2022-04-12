import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NumberSelectButton extends StatelessWidget {
  final dynamic callback;
  String label;
  bool active;

  NumberSelectButton({@required this.callback, this.label = " ", this.active = true }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: active ? MaterialStateProperty.all<Color>(Colors.white) : MaterialStateProperty.all<Color?>(Colors.grey[200]),
        backgroundColor: active ? MaterialStateProperty.all<Color>(Colors.white) : MaterialStateProperty.all<Color?>(Colors.grey[200]),
      ),
      onPressed: callback, 
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.blue[400] : Colors.grey[700], fontSize: (kIsWeb ? MediaQuery.of(context).size.width / 30 : MediaQuery.of(context).size.height / 15), decoration: !active ? TextDecoration.lineThrough : null),
        ),
      )
      );

  }
}