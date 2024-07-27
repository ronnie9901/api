import 'package:flutter/material.dart';
class HomeModel{

  List<Hit> hitlist=[];

  HomeModel({required this.hitlist});

  factory HomeModel.fromjson(Map m1){
     return HomeModel(hitlist: (m1['hits'] as List).map((e) => Hit.fromJson(e),).toList());
  }

}

class Hit{

  late String  watforamat;
  Hit({required this.watforamat});

  factory Hit.fromJson(Map m1)
  {
    return Hit(watforamat: m1['webformatURL']);
  }
}