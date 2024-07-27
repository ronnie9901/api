
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelperRacipes
{
  Future<Map> fetchApi()
  async {
    Uri url = Uri.parse('https://dummyjson.com/recipes');
    Response response = await http.get(url);

    if(response.statusCode == 200)
    {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    }
    else
    {
      return{};
    }
  }
}
