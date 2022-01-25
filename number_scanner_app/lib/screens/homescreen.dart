import 'dart:io';

import 'package:flutter/material.dart';
import 'package:number_scanner_app/static/strings.dart' as st;
class HOMESCREEN extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(st.appname)),
    );
  }
}