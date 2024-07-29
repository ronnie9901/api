
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelperRacipesProduct
{
  Future<Map> fetchApiProduct()
  async {
    Uri url = Uri.parse('https://dummyjson.com/products');
    Response response = await http.get(url);

    if(response.statusCode == 200)
    {
      final json = response.body;
      Map data = jsonDecode(json);
      print('success');
      return data;
    }
    else
    {
      return{};
    }
  }
}
