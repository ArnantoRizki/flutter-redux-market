import 'package:flutter/material.dart';
import 'market.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_market/model/comodity.dart';
import 'package:flutter_redux_market/redux/reducers.dart';

void main(){
  final store = new Store<List<ComodityItem>>(cartItemReducer, initialState: new List());
  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  final Store<List<ComodityItem>> store;

  MyApp({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Redux on Flutter',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: MarketPage(store: store,),
      ),
    );
  }
}
