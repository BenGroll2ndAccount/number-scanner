import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:number_scanner_app/service/api.dart' as api;

class SKU_HOMESCREEN extends StatelessWidget {
  String SKU = "";
  ValueNotifier<List> entrys = ValueNotifier<List>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SKU"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "SKU Eingeben...",
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) async {
                      SKU = value.toString();
                      entrys.value = const [SpinKitPulse(color: Colors.red)];
                      entrys.value = await api.get_via_sku(SKU);
                      },
                    onChanged: (value) {SKU = value.toString();},
                  ),),
                  IconButton(onPressed: () async {
                    entrys.value = const [SpinKitPulse(color: Colors.red)];
                    entrys.value = await api.get_via_sku(SKU);
                  }, icon: const Icon(Icons.search_outlined)),
              const SizedBox(height: 7),
              const Divider(thickness: 1),
              ValueListenableBuilder(
                valueListenable: entrys,
                builder: (BuildContext context, List value, Widget? foo) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: value[index],
                        );},
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 1);
                      },
                    ),
                  );
                })
            ],
          ),
            ]),
      ),
    ));
  }
}
