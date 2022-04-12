import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:number_scanner_app/static/strings.dart' as st;
import 'package:number_scanner_app/service/api.dart' as api;

class EAN_HOMESCREEN extends StatelessWidget {
  EAN_HOMESCREEN({ Key? key }) : super(key: key);
  String? ean = "";
  ValueNotifier<List<Widget>> resultwidgets = ValueNotifier<List<Widget>>([]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: st.getAppText(context), backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "EAN...",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    ean = value;
                  },
                  onSaved: (value) async {
                    ean = value;
                    resultwidgets.value = [
                      SpinKitCircle()
                    ];
                    resultwidgets.value = await api.get_via_ean(ean);
                  },
                )),
                Expanded(child: IconButton(
                  onPressed: () async{
                    resultwidgets.value = [
                      const SpinKitCircle(color: Colors.red,)
                    ];
                    resultwidgets.value = await api.get_via_ean(ean);
                  },
                  icon: const Icon(Icons.search_outlined)))
              ],
            ),
            const Divider(thickness: 1),
            Expanded(child: ValueListenableBuilder(
              valueListenable: resultwidgets,
              builder: (BuildContext context, List<Widget> widgets, Widget? foo) {
                return widgets == [] ? Container() : ListView(
                  shrinkWrap: true,
                  children: widgets
                  );
              },
             )),
          ],
        ),
      ),
    );
  }
}