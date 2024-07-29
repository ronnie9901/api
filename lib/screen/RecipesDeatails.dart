import 'package:api/screen/racipesHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/rapiceprovider.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    RacipesProvider racipesModalfalse =
        Provider.of<RacipesProvider>(context, listen: false);
    RacipesProvider racipesModaltrue =
        Provider.of<RacipesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('detais'),
      ),
      body: FutureBuilder(
        future: racipesModalfalse.frommap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(
                  racipesModaltrue
                      .racipesModel!.racipeslist[selectedIndex].name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(racipesModaltrue.racipesModel!
                              .racipeslist[selectedIndex].image))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        ' Time Duration :${racipesModaltrue.racipesModel!.racipeslist[selectedIndex].cookTimeMinutes} Minites'),

                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: (racipesModaltrue.selectedPage == 0)
                                    ? const Border(
                                        bottom: BorderSide(
                                          width: 3,
                                          color: Colors.amber,
                                        ),
                                      )
                                    : null,
                              ),
                              child: const Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: (racipesModaltrue.selectedPage == 1)
                                    ? const Border(
                                        bottom: BorderSide(
                                          width: 3,
                                          color: Colors.amber,
                                        ),
                                      )
                                    : null,
                              ),
                              child: const Text(
                                'Instructions',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: PageView(
                            onPageChanged: (value) {
                              racipesModalfalse.changePage(value);
                            },
                            children: [
                              Text(
                                racipesModaltrue.racipesModel!
                                    .racipeslist[selectedIndex].ingredients
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                racipesModaltrue.racipesModel!
                                    .racipeslist[selectedIndex].instructions
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade400),
        child: TextButton(
          onPressed: () {
            addlist.add(racipesModaltrue.racipesModel!.racipeslist[selectedIndex]);
            Navigator.of(context).pushNamed('/add');
          },
          child: Text('add List'),
        ),
      ),
    );
  }
}
List addlist=[];
