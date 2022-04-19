class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String decsription;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.decsription,
    required this.location
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(name: json["name"],
        img: json["img"],
        price: json["price"],
        people: json["people"],
        stars: json["stars"],
        decsription: json["description"],
        location: json["location"]);
  }
}