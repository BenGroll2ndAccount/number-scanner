import 'dart:convert';
import 'dart:io';

import "package:flutter/material.dart";
import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

class ItemEntry {
  final String name;
  final double price;
  final String link;
  final String condition;
  ItemEntry({this.name = "-", this.price = -1, this.link = "", this.condition = "None"});
}

List<ItemEntry> buildentrys(Map<String, dynamic> data) {
  List<ItemEntry> returnlist = [];
  for(int i = 0; i < data.keys.length; i++) {
    Map<String, dynamic> this_entry_data = data[data.keys.toList()[i]];
    ItemEntry entry = ItemEntry(
      name : this_entry_data["name"],
      price: double.parse(this_entry_data["price"]),
      link: this_entry_data["link"],
      condition: this_entry_data["condition"]
    );
    returnlist.add(entry);
  }
  return returnlist;
}


Future<Map<String, dynamic>> getSoapResponseTestSKU(String sku) async {
  String url = "https://dev2.promusictools.com/pctool";
  String username = "promusictools";
  String password = "developer";
  String basicAuth = "Basic " + base64Encode(utf8.encode("$username:$password"));
  var request = http.get(
    "https://dev2.promusictools.com/pctool?ysS2O=Sjdasdn&sku=$sku",
    headers: {
      "authorization" : basicAuth,
    }
  );
  Map<String, dynamic> body = await request.then((value) {return jsonDecode(value.body);});
  return body;
}

List<ResultCard> buildCardsFromEntrys(List<ItemEntry> entrys) {
  List<ResultCard> returnlist = [];
  for(int i = 0; i < entrys.length; i++) {
    ItemEntry entry = entrys[i];
    ResultCard widget = ResultCard(
      name: entry.name,
      condition: entry.condition,
      saleprice : entry.price,
      link: entry.link,
    );
    returnlist.add(widget);
  }
  return returnlist;
}

Future<List<Widget>> get_via_sku(String sku) async {
  Map<String, dynamic> data = await getSoapResponseTestSKU(sku);
  List<ItemEntry> items = buildentrys(data);
  return buildCardsFromEntrys(items);
}

Color? getColorForAvailability(availability) {
  switch(availability) {
    case "Auf Lager": {return Colors.green;}
    case "Kurzfristig lieferbar": {return Colors.green;}
    case "Mittelfristig lieferbar": {return Colors.yellow[700];}
    case "Bestellt / in Kürze ab Lager lieferbar": {return Colors.yellow[700];}
    case "Ausverkauft / Nachbestellt": {return Colors.yellow[700];}
    case "Auf Sonderbestellung lieferbar": {return Colors.yellow[700];}
    case "Noch nicht lieferbar": {return Colors.yellow[700];}
    case "Reserviert": {return Colors.yellow[700];}
    case "Vorübergehend nicht lieferbar": {return Colors.red;}
    case "Ausverkauft" : {return Colors.red;}

    default: {
      return Colors.teal;
    }    
  }
}


class ResultCard extends StatelessWidget {
  final String name;
  final String condition;
  final double saleprice;
  final String link;

  ResultCard({ Key? key, this.name = "", this.condition = "",this.saleprice = -1, this.link = ""}) : super();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 20.0),),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.info),
                        Text(condition),
                      ],
                    ),
                   
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(saleprice.toString() + "€", style: const TextStyle(color: Colors.red))
              ],
            )
          ],),
      ),
    );
  }
}