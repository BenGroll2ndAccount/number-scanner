import 'package:flutter/material.dart';
import 'package:number_scanner_app/static/strings.dart' as st;

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  ResultScreen({this.data = const {}}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: st.getAppText(context), centerTitle: true, backgroundColor: Colors.white, elevation: 3.0,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles : buildChildrenFromData(data["data"])).toList(),
        ),
        ),
    );
  }
}

List<ListTile> buildChildrenFromData(List data){
  List<ListTile> returnlist = [];
  for(int i = 0; i < data.length; i++) {
    ResultCard card = ResultCard(
      name : data[i]["name"],
      condition: data[i]["condition"],
      availability: data[i]["availability"],
      oldprice: data[i]["price-normal"],
      saleprice: data[i]["price-sale"],
    );
    returnlist.add(ListTile(title: card));
  }
  return returnlist;
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
  final String availability;
  final double saleprice;
  final double oldprice;

  ResultCard({ Key? key, this.name = "", this.condition = "", this.availability = "",this.saleprice = -1 ,this.oldprice = -1}) : super();
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
                    Row(
                      children: [
                        Icon(Icons.reorder, color: getColorForAvailability(availability)),
                        Text(availability, style: TextStyle(color: getColorForAvailability(availability)),)
                      ],
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(oldprice.toString() + "€", style: const TextStyle(color: Colors.black)),
                    Text(saleprice.toString() + "€", style: const TextStyle(color: Colors.red))
                  ],
                )

              ],
            )
          ],),
      ),
    );
  }
}