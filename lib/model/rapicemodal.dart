class RacipesModal {
  late List racipeslist = [];

  RacipesModal({required this.racipeslist});

  factory RacipesModal.fromjson(Map m1) {
    return RacipesModal(
        racipeslist: (m1['recipes'] as List)
            .map(
              (e) => details.fromjson(e),
            )
            .toList());
  }
}

class details {
  late int id, prepTimeMinutes, cookTimeMinutes, reviewCount;
  late String name, image, cuisine, difficulty;
  late List tags = [];
  late List ingredients = [];
  late List instructions = [];

  details(
      { required this.id,
        required this.prepTimeMinutes,
        required this.cookTimeMinutes,
        required this.reviewCount,
        required this.name,
        required  this.image,
        required this.cuisine,
        required this.difficulty,
        required this.tags,
        required this.ingredients,
        required this.instructions});
  factory details.fromjson(Map m1){
    return details(difficulty : m1['difficulty'],
        id: m1['id'],
        prepTimeMinutes: m1['prepTimeMinutes'],
        cookTimeMinutes: m1['cookTimeMinutes'],
        reviewCount: m1['reviewCount'],
        name: m1['name'],
        image: m1['image'],
        tags: m1['tags'],
        ingredients: m1['ingredients'],
        instructions: m1['instructions'],
        cuisine: m1['cuisine']);
  }
}
