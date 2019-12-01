import 'package:flutter/material.dart';
import 'package:flutter_redux_market/model/comodity.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_market/redux/actions.dart';


class BeliDialog extends StatefulWidget {
  final ComodityItem comodityItem;
  BeliDialog({Key key, @required this.comodityItem});
  @override
  _BeliDialogState createState() => _BeliDialogState();
}

String hargatotal(int price, int ntotal){
  int retval = price * ntotal;
  return retval.toString();
}

class _BeliDialogState extends State<BeliDialog> {
  ComodityItem itemName;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<ComodityItem>, OnItemAddedCallback>(
      converter: (store)=>(itemName) => store.dispatch(AddItemAction(itemName)),
      builder:(context, callback)=>Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("Penjual"),
                  flex: 2,
                ),
                Expanded(
                  child: Text(widget.comodityItem.penjual),
                  flex: 3,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("Harga"),
                  flex: 2,
                ),
                Expanded(
                  child: Text("Rp. ${widget.comodityItem.harga.toString()}"),
                  flex: 3,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("Jumlah"),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            widget.comodityItem.beli==0?widget.comodityItem.beli=0:widget.comodityItem.beli = widget.comodityItem.beli - 1;
                            itemName = widget.comodityItem;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text('-', style: TextStyle(color: Colors.greenAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Text(widget.comodityItem.beli.toString()),
                      InkWell(
                        onTap: (){
                          setState(() {                            
                            widget.comodityItem.beli==widget.comodityItem.jual?widget.comodityItem.beli=widget.comodityItem.jual:widget.comodityItem.beli = widget.comodityItem.beli + 1;
                            itemName = widget.comodityItem;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text('+', style: TextStyle(color: Colors.greenAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),            
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Harga total"),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("Rp. ${hargatotal(widget.comodityItem.harga, widget.comodityItem.beli)}"),
                    flex: 3,
                  )
                ],
              )
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: Text("Beli"),
                    ),
                  ),
                  onTap: (){
                    // var mixList = [1,2,1,3,2];
                    // var num = mixList.where((item)=>item==2).toList();
                    // print(num..add(mixList[1]));
                    itemName = widget.comodityItem;
                    callback(itemName);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef OnItemAddedCallback = Function(ComodityItem itemName);