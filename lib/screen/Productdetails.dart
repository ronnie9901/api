import 'package:api/provider/ProductProvider..dart';
import 'package:api/screen/Productcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ProductModel.dart';
import 'ProductHome.dart';

class Productdetails extends StatelessWidget {
  ProductModel? ha;

  Productdetails({super.key, required this.ha});

  @override
  Widget build(BuildContext context) {
    print(ha!.Productlist.length);
    ProductProvider ProductModalfalse =
        Provider.of<ProductProvider>(context, listen: false);
    ProductProvider ProducctModaltrue =
        Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
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
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        ha!.Productlist[selectedIndex].images[0]))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            width: double.infinity,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${ha!.Productlist[selectedIndex].title}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 ' ${ha!.Productlist[selectedIndex].rating.toString()} ⭐',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 '  Price ${ha!.Productlist[selectedIndex].price.toString()}/-',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '  Discount ${ha!.Productlist[selectedIndex].discountPercentage.toString()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '  Catagory ${ha!.Productlist[selectedIndex].category} :',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '  Catagory ${ha!.Productlist[selectedIndex].description}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12),
        child: TextButton(
          onPressed: () {

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  Productcard(),
            ));

          },
          child: Text('add List'),
        ),
      ),
    );
  }

}
List cardList=[];