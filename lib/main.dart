import 'package:api/provider/apiprovider.dart';
import 'package:api/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
    home: HomePage(),
    ));
  }
}
