import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.success,
    required this.categories,
  });

  bool success;
  List<CategoryElement> categories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        success: json["success"],
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class CategoryElement {
  CategoryElement({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
