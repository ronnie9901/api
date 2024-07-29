class ProductModel {
  late List<Productss> Productlist = [];

  ProductModel({required this.Productlist});

  factory ProductModel.fromjson(Map m1) {
    return ProductModel(
        Productlist: (m1['products'] as List)
            .map(
              (e) => Productss.fromjson(e),
            )
            .toList());
  }
}

class Productss {
  late int id,stock;
  late double rating,price,discountPercentage;
  late String title,
      description,
      category,
      warrantyInformation;
  late List images = [];

  Productss(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.warrantyInformation,

        required this.images});

  factory Productss.fromjson(Map m1) {
    return Productss(
        id: m1['id'],
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        price: m1['price'].toDouble(),
        discountPercentage: m1['discountPercentage'].toDouble(),
        rating: m1['rating'].toDouble(),
        stock: m1['stock'],
        warrantyInformation: m1['warrantyInformation'],
          images: m1['images']);
  }
}
