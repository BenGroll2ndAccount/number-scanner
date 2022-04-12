import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const appname = "ProCheckTool";
RichText getAppText(context) {
  return RichText(text: TextSpan(
        style: TextStyle(fontSize: (kIsWeb ? MediaQuery.of(context).size.height / 20 : MediaQuery.of(context).size.height) ,color : Colors.black),
        children: const <TextSpan>[
          TextSpan(text: "Pro", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: "Music", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          TextSpan(text: "Tools", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        ]
      ));
}
