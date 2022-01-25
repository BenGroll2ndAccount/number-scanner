import 'package:flutter/material.dart';
import 'package:number_scanner_app/screens/homescreen.dart';
import 'package:xml/xml.dart' as xml;

class Contact {
  String _name, _email;

  Contact(this._name, this._email);

  factory Contact.fromJSON(Map<String, dynamic> json) {
    if(json == null){
      return Contact("", "");
    } else {
      return Contact(json["name"], json["email"]);
    }
  }

}

Future<List<Contact>> getContactsFromXML(BuildContext context) async {
  String xmlString = await DefaultAssetBundle.of(context).loadString("assets/contact.xml");
  var raw = xml.parse(xmlString);
  var elements = raw.findAllElements("contact");
  return elements.map((element) {
    return Contact(
      element.findElements("name").first.text, 
      element.findElements("email").first.text
      );
  }).toList();

}