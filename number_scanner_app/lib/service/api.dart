import "package:flutter/material.dart";
import 'package:requests/requests.dart';
import 'xmlparse.dart';
import 'package:http/http.dart' as http;

dynamic getSoapResponseTest(context) async {
  String xm = await DefaultAssetBundle.of(context).loadString("assets/contact.xml");  
  var url = Uri.parse("http://www.dneonline.com/calculator.asmx");
  var response = await http.post(url, body : xm);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  
   
    
}