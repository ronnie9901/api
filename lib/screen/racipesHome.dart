//
//
// import 'package:api/model/rapicemodal.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class RacipesHome extends StatelessWidget {
//   const RacipesHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     RacipesModal racipesModalfalse = Provider.of<RacipesModal>(context,listen: false);
//     RacipesModal racipesModaltrue = Provider.of<RacipesModal>(context,listen: true);
//     return Scaffold(
//       appBar:  AppBar(title: Text('Home page '),),
//
//       body: Column(children: [
//         Stack(children: [
//           FutureBuilder(future: Provider.of<RacipesModal>(context,listen: false) builder: builder)
//
//         ],)
//       ],),
//     );
//   }
// }
