
import 'package:api/model/model.dart';
import 'package:flutter/foundation.dart';

import '../api/api.dart';

class ApiProvider extends ChangeNotifier{

  Apihelper apihelper= Apihelper();
  HomeModel? homeModel;
String search='';
  void searchImage(String img)
  {
    search = img;
    notifyListeners();
  }


  Future<HomeModel?> frommap(String  img)
  async {
    final  data =await apihelper.fatch(img);
    homeModel = HomeModel.fromjson(data);
    return homeModel;
  }


}