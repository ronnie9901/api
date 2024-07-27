
import 'package:api/api/rapiceapi.dart';
import 'package:api/model/model.dart';
import 'package:api/model/rapicemodal.dart';
import 'package:flutter/foundation.dart';

import '../api/api.dart';

class RacipesProvider extends ChangeNotifier{

  ApiHelperRacipes apiHelperRacipes= ApiHelperRacipes();
  RacipesModal? racipesModel;
  int selectindex=0;
  void select(int index)
  {
    selectindex = index;
    notifyListeners();
  }


  Future<RacipesModal?> frommap()
  async {
    final  data =await apiHelperRacipes.fetchApi();
    racipesModel = RacipesModal.fromjson(data);
    return racipesModel;
  }


}