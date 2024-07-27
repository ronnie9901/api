import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Future<Map> fatch(String search) async {
    Uri url = Uri.parse(
        'https://pixabay.com/api/?key=45126444-bf2374c97e7cd5020acea8811&q=$search&image_type=photo');

    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
