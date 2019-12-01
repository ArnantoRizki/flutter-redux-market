import 'package:flutter/material.dart';
import 'shopping-list.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Center(child: Text("Pembelian", style: TextStyle(color: Colors.white),)),        
      ),
      body: ShoppingList(),
    );
  }
}