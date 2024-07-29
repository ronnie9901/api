import 'package:api/api/Product.dart';
import 'package:flutter/cupertino.dart';

import '../model/ProductModel.dart';

class ProductProvider extends ChangeNotifier {


  ApiHelperRacipesProduct apiHelperRacipesProduct = ApiHelperRacipesProduct();
  ProductModel? productModel;



  Future<ProductModel?> frommap() async {
    final data = await apiHelperRacipesProduct.fetchApiProduct();
    ProductModel productModel = ProductModel.fromjson(data);
    print('success');
    return productModel;
  }


  void minusQuantity(int index) {
    if (cartList[index]['qty'] > 1) {
      cartList[index]['qty']--;
      Amount = (Amount - cartList[index]['prise']).toDouble();
      notifyListeners();
    }
  }

  void addQuantity(int index) {
    cartList[index]['qty']++;
    Amount = (Amount + cartList[index]['prise']).toDouble();
    notifyListeners();
  }

  void removeProductFromCart(int index) {
    Amount = Amount - (cartList[index]['prise'] * cartList[index]['qty']);
    Amount = double.parse((Amount).toStringAsFixed(2));
    if (Amount.abs() < 0.01) {
      Amount = 0.00;
    }
    cartList.removeAt(index);
    // count[index] = 1;
    notifyListeners();

  }



}
double Amount = 0;
List cartList = [];