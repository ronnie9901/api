import 'package:api/model/rapicemodal.dart';
import 'package:api/provider/rapiceprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RacipesHome extends StatelessWidget {
  const RacipesHome({super.key});

  @override
  Widget build(BuildContext context) {
    RacipesProvider racipesModalfalse =
        Provider.of<RacipesProvider>(context, listen: false);
    RacipesProvider racipesModaltrue =
        Provider.of<RacipesProvider>(context, listen: true);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<RacipesProvider>(context, listen: false).frommap(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final ha = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Embark On Your Cooking Journey',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(style: TextStyle(fontSize: 9),decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.search),suffixIcon: Icon(CupertinoIcons.mic),label: Text('Search '),enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10) )),),
                  ),

                  ...List.generate(
                      ha!.racipeslist.length,
                      (index) => Card(
                        child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.more_vert),
                                            ),
                                            InkWell(
                        onTap: () {
                           selectedIndex=index;
                          Navigator.of(context).pushNamed('/de');
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.7,
                                  image:NetworkImage(ha.racipeslist[index].image)
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    ha!.racipeslist[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ha!.racipeslist[index].cuisine,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                        
                                Text(
                                  '  ${ha!.racipeslist[index].id} ',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '  ${ha!.racipeslist[index].cookTimeMinutes} min',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '  ⭐⭐  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  '   ${ha!.racipeslist[index].cuisine }',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Text(
                                  '   ${ha!.racipeslist[index].difficulty }',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                          SizedBox(height: 60,)
                        
                              ],
                            ),
                          ],
                        ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                      ),)
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
int selectedIndex=0;
