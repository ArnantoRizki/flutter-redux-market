import 'package:flutter_redux_market/model/comodity.dart';
import 'actions.dart';

List<ComodityItem> cartItemReducer(List<ComodityItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is DeleteItemAction) {
    return deleteItem(items, action);
  }else if(action is UpdateItemAction){
    return updateItem(items, action);
  }
  return items;
}

List<ComodityItem> addItem(List<ComodityItem> items, AddItemAction action) {
  List<ComodityItem> sameItems = items
    .where((item) => item.id == action.item.id && item.idpenjual == action.item.idpenjual)
    .toList();
  if (sameItems.length==0){
    return new List.from(items)..add(action.item);    
  }else{
    return List.from(items);
  }    
}

List<ComodityItem> deleteItem(List<ComodityItem> items, DeleteItemAction action) {
  return new List.from(items)..remove(action.item);
}

List<ComodityItem> updateItem(List<ComodityItem> items, UpdateItemAction action) {
  List<ComodityItem> newItems = items
      .map((item) => item.id == action.item.id && item.idpenjual == action.item.idpenjual ? action.item : item)
      .toList();
  return newItems;
}