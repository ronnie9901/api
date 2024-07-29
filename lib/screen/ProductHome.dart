import 'package:api/model/ProductModel.dart';
import 'package:api/provider/ProductProvider..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Productdetails.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).frommap(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            ProductModel? ha = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Embark On Your Cooking Journey',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(fontSize: 9),
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search),
                          suffixIcon: Icon(CupertinoIcons.mic),
                          label: Text('Search '),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Row(
                    children: [Text('')],
                  ),
                  ...List.generate(
                    ha!.Productlist.length,
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
                                  selectedIndex = index;
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Productdetails(ha: ha),
                                  ));
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
                                            fit: BoxFit.contain,
                                            image: NetworkImage(ha
                                                .Productlist[index].images[0])),
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
                                            ha!.Productlist[index].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '  ${ha!.Productlist[index].id} ',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '  ${ha!.Productlist[index].price} ',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '  ${ha!.Productlist[index].category} ',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '   ${ha!.Productlist[index].rating} ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 60,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
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

int selectedIndex = 0;
