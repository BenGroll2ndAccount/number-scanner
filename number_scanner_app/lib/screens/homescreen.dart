import 'dart:io';
import 'package:number_scanner_app/templates/widgettemplates.dart' as wt;
import 'package:flutter/material.dart';
import 'package:number_scanner_app/static/strings.dart' as st;
import 'package:number_scanner_app/service/api.dart' as api;

import 'package:number_scanner_app/screens/scanscreens/snhomescreen.dart';
import 'package:number_scanner_app/screens/scanscreens/skuhomescreen.dart';
import 'package:number_scanner_app/screens/scanscreens/qrhomescreen.dart';
import 'package:number_scanner_app/screens/scanscreens/eanhomescreen.dart';
import 'package:number_scanner_app/screens/scanscreens/mpnhomescreen.dart';
import 'dart:convert';





class HOMESCREEN extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: st.getAppText(context), elevation: 3.0, backgroundColor: Colors.white, centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 30,
                children: [
                  wt.NumberSelectButton(callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SN_HOMESCREEN()));
                  }, label: "SN", active: true),
                  wt.NumberSelectButton(callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EAN_HOMESCREEN()));
                  }, label: "EAN", active: true),
                  wt.NumberSelectButton(callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SKU_HOMESCREEN()));
                  }, label: "SKU", active: true),
                  wt.NumberSelectButton(callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPN_HOMESCREEN()));
                  }, label: "MPN", active: true),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wt.NumberSelectButton(callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QR_HOMESCREEN()));
                  }, label: "QR", active: false)
                ],
              )
            ],
          ),
          
        ),
      ),
    );
  }
}


