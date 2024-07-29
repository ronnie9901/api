import 'package:api/screen/racipesHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/rapiceprovider.dart';

class cardpage extends StatelessWidget {
  const cardpage({super.key});

  @override
  Widget build(BuildContext context) {
    RacipesProvider racipesModalfalse =
    Provider.of<RacipesProvider>(context, listen: false);
    RacipesProvider racipesModaltrue =
    Provider.of<RacipesProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(title: Text('card page'),),
      body: ListView.builder(itemCount: racipesModaltrue.racipesModel!.racipeslist.length,itemBuilder: (context, index) => Card(child: ListTile(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(racipesModaltrue.racipesModel!.racipeslist[selectedIndex].image)),
                color: Colors.white, shape: BoxShape.circle),

          ),
          Column(
            children: [

              Text(racipesModaltrue.racipesModel!.racipeslist[selectedIndex].name,),
              Text(racipesModaltrue.racipesModel!.racipeslist[selectedIndex].difficulty),
              Text('  '),
            ],
          ),
          IconButton(onPressed: () {


          }, icon: Icon(Icons.delete))
        ],
      ),),),)
    );
  }
}
