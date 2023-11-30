import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Count2State with ChangeNotifier{
  Map<String,int> contentMap = SplayTreeMap();

  initData()
  {
    contentMap["a"]=0;
    contentMap["b"]=0;
    contentMap["c"]=0;
  }

  increment(String content){
    if(contentMap.containsKey(content)){
      contentMap[content] = contentMap[content]! +1;
      notifyListeners();
    }
  }
}