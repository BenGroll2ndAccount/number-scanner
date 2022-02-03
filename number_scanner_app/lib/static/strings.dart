import 'package:flutter/material.dart';
const appname = "ProCheckTool";

RichText getAppText(context) {
  return RichText(text: TextSpan(
        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 15, color : Colors.black),
        children: const <TextSpan>[
          TextSpan(text: "Pro", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: "Check", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          TextSpan(text: "Tool", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        ]
      ));
}
