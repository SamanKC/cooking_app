class Recipe {
  String id;
  String title;
  String image;
  String imagea;
  String imageb;
  String serving;
  String time;
  String rating;
  String name;
  String subname;
  final price;

  Recipe(
      {this.title,
      this.time,
      this.serving,
      this.image,
      this.id,
      this.imagea,
      this.imageb,
      this.name,
      this.price,
      this.rating,
      this.subname});
}

class NewRecipe {
  final String title;
  final String time;
  final String serving;
  final String image;

  NewRecipe({this.title, this.time, this.serving, this.image});
}

class Follows {
  final String image;
  final String name;
  final String subname;

  Follows({this.image, this.name, this.subname});
}
