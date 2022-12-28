class Item {
  int id;
  String name;
  String description;
  int price;
  int rate;
  String imagePath;
  String category;
  bool available;

  Item(
      {required this.name,
      required this.id,
      required this.description,
      required this.price,
      required this.rate,
      required this.imagePath,
      required this.category,
      required this.available});

  Map<String, dynamic> toJson() => {
        "name": name,
        "imagePath": imagePath,
        "description": description,
        "price": price,
        "rate": rate,
        "category": category,
        "available": available
      };
}
