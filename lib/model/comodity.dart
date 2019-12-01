import 'package:meta/meta.dart';

class ComodityItem {
  final int id;
  final int idpenjual;
  final String penjual;
  final String komoditas;
  int beli;
  final int harga;
  final int jual;

  ComodityItem({
    @required this.id,
    @required this.idpenjual,
    @required this.penjual,
    @required this.komoditas,
    @required this.beli,
    @required this.harga,
    @required this.jual
  });

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'id': id,
      'id_penjual': idpenjual,
      'penjual': penjual,
      'komoditas': komoditas,
      'beli': beli,
      'harga': harga,
      'jual': jual
    };
  }
}

class Pembelian{
  int total;
  List<ComodityItem> allitems;

  Pembelian({
    this.total,
    this.allitems
  });

  int totalharga(List<ComodityItem> kabeh){
    int retval = 0;
    kabeh.forEach((val){
      retval += val.harga * val.beli;
    });
    return retval;
  }

  Map<String, dynamic> toJson()=>{
    'total': total,
    'items': encondeToJson(allitems)
  };

  List<Map<String, dynamic>> encondeToJson(List<ComodityItem> list){
    List<Map<String, dynamic>> jsonList = List();
    list.map((item)=>jsonList.add(item.toJson())).toList();
    return jsonList;
  }
}