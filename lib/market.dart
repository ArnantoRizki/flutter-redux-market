import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_market/model/comodity.dart';
import 'dialog-beli.dart';
import 'shopping.dart';

class MarketPage extends StatefulWidget {
  final Store<List<ComodityItem>> store;
  MarketPage({Key key, @required this.store}):super(key: key);
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  List<ComodityItem> pasar = [
    ComodityItem(
      id: 1,
      idpenjual: 1,
      komoditas: "Pete",
      penjual: "Pak Sodik",
      harga: 8000,
      beli: 0,
      jual: 10
    ),
    ComodityItem(
      id: 1,
      idpenjual: 2,
      komoditas: "Pete",
      penjual: "Pak Peter",
      harga: 9200,
      beli: 0,
      jual: 23
    ),
    ComodityItem(
      id: 2,
      idpenjual: 1,
      komoditas: "Pepaya",
      penjual: "Pak Sodik",
      harga: 15000,
      beli: 0,
      jual: 8
    ),
    ComodityItem(
      id: 2,
      idpenjual: 3,
      komoditas: "Pepaya",
      penjual: "Pak Fuad",
      harga: 13000,
      beli: 0,
      jual: 4
    ),
    ComodityItem(
      id: 3,
      idpenjual: 3,
      komoditas: "Nangka",
      penjual: "Pak Fuad",
      harga: 13000,
      beli: 0,
      jual: 4
    ),
  ];  

  dialogBeli(komoditi){
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context){
      return AlertDialog(
        title: Center(child: Text(komoditi.komoditas , style: TextStyle(color: Colors.greenAccent),)),
        elevation: 12.0,
        content: BeliDialog(comodityItem: komoditi,)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Center(child: Text('Market'),),
            ),
            InkWell(
              child: Icon(Icons.shopping_basket),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ShoppingPage())
                );
              },              
            )
          ],
        )
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
          child: ListView.builder(
            itemCount: pasar.length,
            itemBuilder: (BuildContext context, int index){
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
                              child: Text(pasar[index].harga.toString())
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            child: Text("Beli", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        onTap: (){
                          dialogBeli(pasar[index]);
                        }
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}