import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_market/model/comodity.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  String hargatotal(int price, int ntotal){
    int retval = price * ntotal;
    return retval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<ComodityItem>, List<ComodityItem>>(
      converter: (store) => store.state,
      builder:(context, pasar)=> Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
        child: Container(
          child: ListView.builder(
            itemCount: pasar.length,
            itemBuilder: (BuildContext context, int index){
              Pembelian maubeli = new Pembelian(total: Pembelian().totalharga(pasar), allitems: pasar);
              print(maubeli.toJson());
              return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text(pasar[index].komoditas, style: TextStyle(color: Colors.greenAccent, fontSize: 16.0, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(pasar[index].penjual)
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Harga Total Rp. ${hargatotal(pasar[index].harga, pasar[index].beli)}")
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            },
          ),
        ),
      )
    );
  }
}