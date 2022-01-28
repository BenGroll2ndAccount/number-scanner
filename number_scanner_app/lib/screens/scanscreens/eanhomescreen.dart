import 'package:flutter/material.dart';

class EAN_HOMESCREEN extends StatelessWidget {
  const EAN_HOMESCREEN({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan EAN")),
    );
  }
}