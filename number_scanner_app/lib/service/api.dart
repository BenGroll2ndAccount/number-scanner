import "package:flutter/material.dart";
import 'package:requests/requests.dart';
import 'xmlparse.dart';
import 'package:http/http.dart' as http;

dynamic getSoapResponseTest(context) async {
  String xm = await DefaultAssetBundle.of(context).loadString("assets/contact.xml");  
  var url = Uri.parse("https://www.promusictools.com/api/v2_soap/index?wsdl=1");
  var response = await http.post(url, body : xm, headers: {"Content-Type" : "text/xml; charset=utf-8", "SOAPAction" : "AuthenticateCredential"});
  print('Response status: ${response.statusCode}');
  var rb = response.body;
  print(rb.runtimeType);
  var ass = rb.split("\n");
  for(int i = 0; i < ass.length; i++) {
    print(ass[i]);
  }
  
   
    
}