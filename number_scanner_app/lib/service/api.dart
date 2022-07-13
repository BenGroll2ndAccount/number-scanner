import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:flutter/material.dart";
import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class ItemEntry {
  final String name;
  final double price;
  final String link;
  final String condition;
  final String mpn;
  final String ean;
  final String small_image_link;
  final int qty;
  ItemEntry({this.name = "-", this.price = -1, this.link = "", this.condition = "None", this.mpn = "", this.ean = "", this.small_image_link = "", this.qty = 0});
}

List<ItemEntry> buildentrys(Map<String, dynamic> data) {
  List<ItemEntry> returnlist = [];
  for(int i = 0; i < data.keys.length; i++) {
    Map<String, dynamic> this_entry_data = data[data.keys.toList()[i]];
    ItemEntry entry = ItemEntry(
      name : this_entry_data["name"],
      price: double.parse(this_entry_data["price"].toString()),
      link: this_entry_data["url_path"],
      condition: this_entry_data["condition_value"],
      mpn: this_entry_data["mpn"],
      ean: this_entry_data["ean"],
      small_image_link: this_entry_data["small_image"],
      qty: this_entry_data["qty"]
    );
    returnlist.add(entry);
    print(entry.small_image_link);
  }
  return returnlist;
}


Future<Map<String, dynamic>> getSoapResponseTestSKU(String? sku) async {
  String url = "www.promusictools.com/pctool";
  String username = "promusictools";
  String password = "developer";
  String basicAuth = "Basic " + base64Encode(utf8.encode("$username:$password"));
  print("Request status: Started");
  try {
  var request = http.get(
    "$url?ysS2O=Sjdasdn&sku=$sku",
  );
  //try {
  Map<String, dynamic> body = await request.then((value) {
    return jsonDecode(value.body);});
  return body;
  } catch(e) {
    return {"exception" : e};
  }

  
}
Future<Map<String, dynamic>> getSoapResponseTestSN(String? sn) async {
  String url = "www.promusictools.com/pctool";
  String username = "promusictools";
  String password = "developer";
  String basicAuth = "Basic " + base64Encode(utf8.encode("$username:$password"));
  print("Request status: Started");
  try {
  var request = http.get(
    "$url?ysS2O=Sjdasdn&serial=$sn",
  );
  print("Requests Status: Waiting");
  dynamic dasdasd = await request;
  print(dasdasd.runtimeType);
  Map<String, dynamic> body = await request.then((value) {
    print(jsonDecode(value.body));
    return jsonDecode(value.body);});
  return body;
  }catch(e){
    return {"exception" : e};
  }
}

Future<Map<String, dynamic>> getSoapResponseTestEAN(String? ean) async {
  try {
  String url = "www.promusictools.com/pctool";
  String username = "promusictools";
  String password = "developer";
  String basicAuth = "Basic " + base64Encode(utf8.encode("$username:$password"));
  print("Request status: Started");
  var request = http.get(
    "$url?ysS2O=Sjdasdn&ean=$ean",
    
  );
  print("Requests Status: Waiting");
  dynamic dasdasd = await request;
  print(dasdasd.runtimeType);
  Map<String, dynamic> body = await request.then((value) {
    print(jsonDecode(value.body));
    return jsonDecode(value.body);});
  return body;
  } catch(e) {
    return {"exception" : e};
  }
}

Future<Map<String, dynamic>> getSoapResponseTestMPN(String? mpn) async {
  String url = "www.promusictools.com/pctool";
  String username = "promusictools";
  String password = "developer";
  String basicAuth = "Basic " + base64Encode(utf8.encode("$username:$password"));
  print("Request status: Started");
  try {
  var request = http.get(
    "$url?ysS2O=Sjdasdn&mpn=$mpn",

  );
  print("Requests Status: Waiting");
  dynamic dasdasd = await request;
  print(dasdasd.runtimeType);
  Map<String, dynamic> body = await request.then((value) {
    print(jsonDecode(value.body));
    return jsonDecode(value.body);});
  return body;
  } catch(e) {
    return {"exception" : e};
  }
}

List<Widget> buildCardsFromEntrys(List<ItemEntry> entrys) {
  List<Widget> returnlist = [];
  for(int i = 0; i < entrys.length; i++) {
    ItemEntry entry = entrys[i];
    ResultCard widget = ResultCard(
      name: entry.name,
      condition: entry.condition,
      saleprice : entry.price,
      link: entry.link,
      mpn: entry.mpn,
      ean: entry.ean,
      small_image_link: entry.small_image_link,
    );
    returnlist.add(widget);
  }
  if (returnlist.isEmpty) {
    returnlist.add(const Text("No Items match the entered filter(s)."));
  }
  return returnlist;
}

Future<List<Widget>> get_via_sku(String? sku) async {
  Map<String, dynamic> data = await getSoapResponseTestSKU(sku);
  if (data.keys.contains("exception")) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), const Text("Exception caught in getSoapResponseTestSKU"), Text(data["exception"].toString())];
  }
  List<ItemEntry> items = buildentrys(data);
  try {
  return buildCardsFromEntrys(items);
  } catch(e) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), Text(e.toString())];
  }
}

Future<List<Widget>> get_via_sn(String? sn) async {
  Map<String, dynamic> data = await getSoapResponseTestSN(sn);
  if (data.keys.contains("exception")) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), const Text("Exception caught in getSoapResponseTestSN"), Text(data["exception"].toString())];
  }
  List<ItemEntry> items = buildentrys(data);
  try {
  return buildCardsFromEntrys(items);
  } catch(e) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), Text(e.toString())];
  }
}

Future<List<Widget>> get_via_ean(String? ean) async {
  Map<String, dynamic> data = await getSoapResponseTestEAN(ean);
  if (data.keys.contains("exception")) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), const Text("Exception caught in getSoapResponseTestSN"), Text(data["exception"].toString())];
  }
  List<ItemEntry> items = buildentrys(data);
  try {
  return buildCardsFromEntrys(items);
  } catch(e) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), Text(e.toString())];
  }
}

Future<List<Widget>> get_via_mpn(String? mpn) async {
  Map<String, dynamic> data = await getSoapResponseTestMPN(mpn);
  if (data.keys.contains("exception")) {
    return [const Text("Etwas ist schiefgelaufen."), const Text("Für den Admin: "), const Text("Exception caught in getSoapResponseTestSN"), Text(data["exception"].toString())];
  }
  List<ItemEntry> items = buildentrys(data);
  try {
  return buildCardsFromEntrys(items);
  } catch(e) {
    return [const Text("Etwas ist schieggelaufen.")];
  }
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
  final String mpn;
  final String ean;
  final int qty;
  final String small_image_link;

  ResultCard({ Key? key, this.name = "", this.condition = "",this.saleprice = -1, this.link = "", this.ean = "", this.mpn = "", this.small_image_link = "", this.qty = 0}) : super();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        print(">>>>>LINK" + link.toString());
        if (await url.canLaunch(link)) {
          await url.launch(link);
        }
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Hidden Info"),
            content: Column(
              children : [
               
                Text("MPN : $mpn", style: TextStyle(fontSize:(kIsWeb ? MediaQuery.of(context).size.height / 100: MediaQuery.of(context).size.width) / 50)),
                Text("EAN: $ean", style: TextStyle(fontSize:(kIsWeb ? MediaQuery.of(context).size.height / 100: MediaQuery.of(context).size.width) / 50)),
                ]
            )
          )
          );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white)
      ),
      child: Card(
      elevation: 0.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
              aspectRatio : 2, 
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image : small_image_link
                  ),
            )),
            Expanded(
              flex: 3,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20.0)),
                SizedBox(height: (kIsWeb ? MediaQuery.of(context).size.height / 50: MediaQuery.of(context).size.width) / 50),
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
                            Icon(Icons.info, color: Colors.grey[800]),
                            Text(condition),
                            Text("QTY: $qty")
                          ],
                        ),
                       
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Text(saleprice.toString() + "€", style: const TextStyle(color: Colors.red))
                  ],
                )
              ],)),
          ],
        ),
      ),
    ));
  }
}