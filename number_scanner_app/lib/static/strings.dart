import 'package:flutter/material.dart';
const appname = "ProCheckTool";

RichText getAppText(context) {
  return RichText(text: TextSpan(
        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 15, color : Colors.black),
        children: const <TextSpan>[
          TextSpan(text: "Pro", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: "Music", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          TextSpan(text: "Tools", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        ]
      ));
}
