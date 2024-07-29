import 'package:api/screen/Productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ProductProvider..dart';

class Productcard extends StatelessWidget {
  Productcard({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider ProductModalfalse =
        Provider.of<ProductProvider>(context, listen: false);
    ProductProvider ProducctModaltrue =
        Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('card page'),
        ),
        body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(''),
                        ),
                        color: Colors.white,
                        shape: BoxShape.circle),
                  ),
                  Column(
                    children: [
                      Text(''),
                      Text(''),
                      Text('  '),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ));
  }
}
