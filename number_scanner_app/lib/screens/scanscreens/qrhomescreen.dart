import 'package:flutter/material.dart';

class QR_HOMESCREEN extends StatelessWidget {
  const QR_HOMESCREEN({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR"),),
    );
  }
}