import 'package:api/provider/ProductProvider..dart';
import 'package:api/provider/apiprovider.dart';
import 'package:api/provider/rapiceprovider.dart';
import 'package:api/screen/ProductHome.dart';
import 'package:api/screen/Productdetails.dart';
import 'package:api/screen/RecipesDeatails.dart';
import 'package:api/screen/homepage.dart';
import 'package:api/screen/racipesHome.dart';
import 'package:api/screen/racipescard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ApiProvider(),),
            ChangeNotifierProvider(create: (context) => RacipesProvider(),),
            ChangeNotifierProvider(create: (context) => ProductProvider(),),

          ],
          builder :  (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/':(context) => ProductHome(),
        '/add':(context) => cardpage(),
      },
    );
  }
}
