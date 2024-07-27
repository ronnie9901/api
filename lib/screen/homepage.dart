import 'package:api/model/model.dart';
import 'package:api/provider/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: false);
    ApiProvider apiProviderTrue =
        Provider.of<ApiProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search Images'),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  apiProvider.searchImage(txtSearch.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ApiProvider>(context, listen: false)
            .frommap(apiProviderTrue.search),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            HomeModel? search = snapshot.data;
            return ListView.builder(
                itemCount: search!.hitlist.length,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${search.hitlist[index].watforamat}'))),
                    ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

TextEditingController txtSearch = TextEditingController();
