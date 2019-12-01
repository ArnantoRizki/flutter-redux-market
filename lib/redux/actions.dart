import 'package:flutter_redux_market/model/comodity.dart';

class AddItemAction {
  final ComodityItem item;

  AddItemAction(this.item);
}

class DeleteItemAction {
  final ComodityItem item;

  DeleteItemAction(this.item);
}

class UpdateItemAction {
  final ComodityItem item;

  UpdateItemAction(this.item);
}



