
import 'package:api/api/rapiceapi.dart';

import 'package:api/model/rapicemodal.dart';
import 'package:flutter/foundation.dart';



class RacipesProvider extends ChangeNotifier{

  ApiHelperRacipes apiHelperRacipes= ApiHelperRacipes();
  RacipesModal? racipesModel;

  Future<RacipesModal?> frommap()
  async {
    final  data =await apiHelperRacipes.fetchApi();
    racipesModel = RacipesModal.fromjson(data);
    return racipesModel;
  }
  int selectedPage=0;
  void changePage(int value){
    selectedPage = value;
    notifyListeners();
  }

}