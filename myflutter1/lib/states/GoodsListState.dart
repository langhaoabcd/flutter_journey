import 'package:flutter/cupertino.dart';

class GoodsListState with ChangeNotifier{
  List<String> _goodsList = List.generate(10, (index) => 
   ""
  );

  get goodsList => _goodsList;
  get total =>_goodsList.length;

  collect(int index){
    var good = _goodsList[index];
    _goodsList[i] = "";
    notifyListeners();
  }
}